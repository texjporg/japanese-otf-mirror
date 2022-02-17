#!/bin/bash
# release-merged.sh
# copied from jfontmaps project and adapted

PROJECT="japanese-otf"
DIR=`pwd`/..
VER=${VER:-`date +%Y%m%d.0`}
DATE=`date +%Y/%m/%d`

TEMP=/tmp

echo "Making Release $VER. Ctrl-C to cancel."
read REPLY
if test -d "$TEMP/$PROJECT-$VER"; then
  echo "Warning: the directory '$TEMP/$PROJECT-$VER' is found:"
  echo
  ls $TEMP/$PROJECT-$VER
  echo $TEMP
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

rm -rf $PROJECT-nonfree-$VER
mkdir $PROJECT-nonfree-$VER

rm -rf $PROJECT-uptex-$VER
mkdir $PROJECT-uptex-$VER

for i in $PROJECT-$VER/* ; do
  bn=`basename $i`
  # japanese-otf(-uptex) contains Hiragino-specific TFM/VF,
  # mark them as nonfree
  # remove the non-free part in the main project
  if test $bn = "japanese-otf"; then
    mkdir -p $PROJECT-nonfree-$VER/ofm
    for j in $PROJECT-$VER/$bn/ofm/*hira{min,kaku,maru}*.ofm ; do
      mv $j $PROJECT-nonfree-$VER/ofm/
    done
    mkdir -p $PROJECT-$VER/ofm
    mv $PROJECT-$VER/$bn/ofm/*  $PROJECT-$VER/ofm/
    rmdir $PROJECT-$VER/$bn/ofm
  fi
  if test $bn = "japanese-otf" -o $bn = "japanese-otf-uptex"; then
    mkdir -p $PROJECT-nonfree-$VER/tfm
    for j in $PROJECT-$VER/$bn/tfm/*hira{min,kaku,maru}*.tfm ; do
      mv $j $PROJECT-nonfree-$VER/tfm/
    done
    mkdir -p $PROJECT-nonfree-$VER/vf
    for j in $PROJECT-$VER/$bn/vf/*hira{min,kaku,maru}*.vf ; do
      mv $j $PROJECT-nonfree-$VER/vf/
    done
    rm $PROJECT-$VER/$bn/README
    rm $PROJECT-$VER/$bn/README.nonfree
  # we don't include fontmap/* for CTAN,
  # as it contains files with parenthesis
  # (ctan2tds also excludes them from installation)
    rm -rf $PROJECT-$VER/$bn/fontmap
    for dir in tfm vf sty ; do
      mkdir -p $PROJECT-$VER/$dir
      mv $PROJECT-$VER/$bn/$dir/*  $PROJECT-$VER/$dir
      rmdir $PROJECT-$VER/$bn/$dir
    done
    for dir in basepl script ; do
      mkdir -p $PROJECT-$VER/src/$dir
      mv $PROJECT-$VER/$bn/$dir/*  $PROJECT-$VER/src/$dir
      rmdir $PROJECT-$VER/$bn/$dir
    done
      mv $PROJECT-$VER/$bn/*makeotf*  $PROJECT-$VER/src
      mv $PROJECT-$VER/$bn/*mkjvf  $PROJECT-$VER/src
    for dir in test ; do
      mkdir -p $PROJECT-$VER/doc/$dir
      mv $PROJECT-$VER/$bn/$dir/*  $PROJECT-$VER/doc/$dir
      rmdir $PROJECT-$VER/$bn/$dir
    done
      mv $PROJECT-$VER/$bn/*{txt,maps,diff}* $PROJECT-$VER/doc
      rm $PROJECT-$VER/$bn/COPYRIGHT
  elif test $bn = "README.merged"; then
    mv $PROJECT-$VER/$bn $PROJECT-$VER/README
  elif test $bn = "README.merged.nonfree"; then
    mv $PROJECT-$VER/$bn $PROJECT-nonfree-$VER/README
  elif test $bn = "README.merged.uptex"; then
    mv $PROJECT-$VER/$bn $PROJECT-uptex-$VER/README
  elif test $bn = "COPYRIGHT.merged"; then
    cp -p $PROJECT-$VER/$bn $PROJECT-nonfree-$VER/COPYRIGHT
    mv $PROJECT-$VER/$bn $PROJECT-$VER/COPYRIGHT
  else
    echo remove $bn
    rm -rf $PROJECT-$VER/$bn
  fi
done

  rmdir $PROJECT-$VER/japanese-otf
  rmdir $PROJECT-$VER/japanese-otf-uptex
  # sty
  perl -pi.bak -e "s{20\d\d/\d\d/\d\d }{$DATE TeX JP org, }g" $PROJECT-$VER/sty/otf.sty
  rm -f $PROJECT-$VER/sty/otf.sty.bak
  # release date
  perl -pi.bak -e "s/\\\$RELEASEDATE/$VER/g" $PROJECT-$VER/README
  rm -f $PROJECT-$VER/README.bak
  perl -pi.bak -e "s/\\\$RELEASEDATE/$VER/g" $PROJECT-nonfree-$VER/README
  rm -f $PROJECT-nonfree-$VER/README.bak
  perl -pi.bak -e "s/\\\$RELEASEDATE/$VER/g" $PROJECT-uptex-$VER/README
  rm -f $PROJECT-uptex-$VER/README.bak
  # make archives
  tar zcf $DIR/$PROJECT-$VER.tar.gz $PROJECT-$VER
  tar zcf $DIR/$PROJECT-nonfree-$VER.tar.gz $PROJECT-nonfree-$VER
  tar zcf $DIR/$PROJECT-uptex-$VER.tar.gz $PROJECT-uptex-$VER
  echo
  echo You should execute
  echo
  echo "  git push && git tag $VER && git push origin $VER"
  echo
  echo Informations for submitting CTAN:
  echo "  CONTRIBUTION: $PROJECT"
  echo "  SUMMARY:      Advanced font selection for pLaTeX and its friends"
  echo "  DIRECTORY:    language/japanese/$PROJECT"
  echo "  LICENSE:      free/other-free"
  echo "  FILE:         $DIR/$PROJECT-$VER.tar.gz"
