#
# release.sh
# copied from jfontmaps project and adapted

if [ "$1" = "" ]; then
    echo "No arguments given."
    exit 1
fi

PROJECT=$1
DIR=`pwd`/..
VER=${VER:-`date +%Y%m%d.0`}

TEMP=/tmp

echo "Making Release $VER. Ctrl-C to cancel."
read REPLY
if test -d "$TEMP/$PROJECT-$VER"; then
  echo "Warning: the directory '$TEMP/$PROJECT-$VER' is found:"
  echo
  ls $TEMP/$PROJECT-$VER
  echo
  echo -n "I'm going to remove this directory. Continue? yes/No"
  echo
  read REPLY <&2
  case $REPLY in
    y*|Y*) rm -rf $TEMP/$PROJECT-$VER;;
    *) echo "Aborted."; exit 1;;
  esac
fi
echo
#git commit -m "Release $VER" --allow-empty
git archive --format=tar --prefix=$PROJECT-$VER/ HEAD | (cd $TEMP && tar xf -)
#git --no-pager log --date=short --format='%ad  %aN  <%ae>%n%n%x09* %s%d [%h]%n' > $TEMP/$PROJECT-$VER/ChangeLog
cd $TEMP
rm -rf $PROJECT-$VER-orig
for i in $PROJECT-$VER/* ; do
  bn=`basename $i`
  if test $bn = $PROJECT; then
    mv $PROJECT-$VER/$bn/* $PROJECT-$VER/
    rmdir $PROJECT-$VER/$bn
  else
    rm -rf $PROJECT-$VER/$bn
  fi
done
cp -r $PROJECT-$VER $PROJECT-$VER-orig
cd $PROJECT-$VER
rm -f .gitignore
for i in README README.md ; do
  if test -f $i; then
    perl -pi.bak -e "s/\\\$VER\\\$/$VER/g" $i
    rm -f ${i}.bak
  fi
done
cd ..
diff -urN $PROJECT-$VER-orig $PROJECT-$VER

if test $PROJECT = "hiraprop"; then
  # hiraprop always requires Hiragino fonts (nonfree),
  # no need for separation (though suffix *-nonfree-* omitted)
  tar zcf $DIR/$PROJECT-$VER.tar.gz $PROJECT-$VER
  echo
  echo You should execute
  echo
  echo "  git push && git tag $VER && git push origin $VER"
  echo
  echo Informations for submitting CTAN: 
  echo "  CONTRIBUTION: $PROJECT"
  echo "  SUMMARY:      TFM/VF support for Hiragino Proportional Alphabet"
  echo "  DIRECTORY:    language/japanese/$PROJECT"
  echo "  LICENSE:      free/other-free"
  echo "  FILE:         $DIR/$PROJECT-$VER.tar.gz"
else
  # japanese-otf(-uptex) contains Hiragino-specific TFM/VF,
  # mark them as nonfree
  rm -rf $PROJECT-nonfree-$VER
  mkdir $PROJECT-nonfree-$VER
  # remove the non-free part in the main project
 if test $PROJECT = "japanese-otf"; then
  mkdir $PROJECT-nonfree-$VER/ofm
  for i in $PROJECT-$VER/ofm/*hira{min,kaku,maru}*.ofm ; do
    mv $i $PROJECT-nonfree-$VER/ofm/
  done
 fi
  mkdir $PROJECT-nonfree-$VER/tfm
  for i in $PROJECT-$VER/tfm/*hira{min,kaku,maru}*.tfm ; do
    mv $i $PROJECT-nonfree-$VER/tfm/
  done
  mkdir $PROJECT-nonfree-$VER/vf
  for i in $PROJECT-$VER/vf/*hira{min,kaku,maru}*.vf ; do
    mv $i $PROJECT-nonfree-$VER/vf/
  done
  mv $PROJECT-$VER/README.nonfree $PROJECT-nonfree-$VER/README
  # make archives
  tar zcf $DIR/$PROJECT-$VER.tar.gz $PROJECT-$VER
  tar zcf $DIR/$PROJECT-nonfree-$VER.tar.gz $PROJECT-nonfree-$VER
  echo
  echo You should execute
  echo
  echo "  git push && git tag $VER && git push origin $VER"
  echo
  echo Informations for submitting CTAN: 
  echo "  CONTRIBUTION: $PROJECT"
 if test $PROJECT = "japanese-otf"; then
  echo "  SUMMARY:      Advanced font selection for pLaTeX and its friends"
 elif test $PROJECT = "japanese-otf-uptex"; then
  echo "  SUMMARY:      Support for Japanese OTF files in upLaTeX"
 fi
  echo "  DIRECTORY:    language/japanese/$PROJECT"
  echo "  LICENSE:      free/other-free"
  echo "  FILE:         $DIR/$PROJECT-$VER.tar.gz"
fi

