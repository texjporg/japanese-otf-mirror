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
if test -d "$TEMP/$PROJECT"; then
  echo "Warning: the directory '$TEMP/$PROJECT' is found:"
  echo
  ls $TEMP/$PROJECT
  echo $TEMP
  echo
  echo -n "I'm going to remove this directory. Continue? yes/No"
  echo
  read REPLY <&2
  case $REPLY in
    y*|Y*) rm -rf $TEMP/$PROJECT;;
    *) echo "Aborted."; exit 1;;
  esac
fi
echo
#git commit -m "Release $VER" --allow-empty
git archive --format=tar --prefix=$PROJECT/ HEAD | (cd $TEMP && tar xf -)
#git --no-pager log --date=short --format='%ad  %aN  <%ae>%n%n%x09* %s%d [%h]%n' > $TEMP/$PROJECT/ChangeLog
cd $TEMP
rm -rf $PROJECT-orig

rm -rf $PROJECT-nonfree
mkdir $PROJECT-nonfree

rm -rf $PROJECT-uptex
mkdir $PROJECT-uptex

for i in $PROJECT/* ; do
  bn=`basename $i`
  # japanese-otf(-uptex) contains Hiragino-specific TFM/VF,
  # mark them as nonfree
  # remove the non-free part in the main project
  if test $bn = "japanese-otf"; then
    mkdir -p $PROJECT-nonfree/ofm
    for j in $PROJECT/$bn/ofm/*hira{min,kaku,maru}*.ofm ; do
      mv $j $PROJECT-nonfree/ofm/
    done
    # We do not use japanese-otf/ofm/otf-cj*-{h,v}.ofm anymore.
    rm -rf $PROJECT/$bn/ofm
  fi
  if test $bn = "japanese-otf" -o $bn = "japanese-otf-uptex"; then
    mkdir -p $PROJECT-nonfree/tfm
    for j in $PROJECT/$bn/tfm/*hira{min,kaku,maru}*.tfm ; do
      mv $j $PROJECT-nonfree/tfm/
    done
    mkdir -p $PROJECT-nonfree/vf
    for j in $PROJECT/$bn/vf/*hira{min,kaku,maru}*.vf ; do
      mv $j $PROJECT-nonfree/vf/
    done
    rm -f $PROJECT/$bn/tfm/{utf,cid}{j,c,t,k}*[0-9a-z]-{h,v}.tfm
    rm -f $PROJECT/$bn/vf/{utf,cid}{j,c,t,k}*[0-9a-z]-{h,v}.vf
    rm -f $PROJECT/$bn/tfm/utf{mr,gr}[0-9a-z]-{h,v}.tfm
    rm -f $PROJECT/$bn/vf/utf{mr,gr}[0-9a-z]-{h,v}.vf
    rm $PROJECT/$bn/README
    rm $PROJECT/$bn/README.nonfree
  # we don't include fontmap/* for CTAN,
  # as it contains files with parenthesis
  # (ctan2tds also excludes them from installation)
    rm -rf $PROJECT/$bn/fontmap
    for dir in tfm vf sty ; do
      mkdir -p $PROJECT/$dir
      mv $PROJECT/$bn/$dir/*  $PROJECT/$dir
      rmdir $PROJECT/$bn/$dir
    done
    for dir in basepl script ; do
      mkdir -p $PROJECT/src/$dir
      mv $PROJECT/$bn/$dir/*  $PROJECT/src/$dir
      rmdir $PROJECT/$bn/$dir
    done
      mv $PROJECT/$bn/*makeotf*  $PROJECT/src
      mv $PROJECT/$bn/*mkjvf  $PROJECT/src
    for dir in test ; do
      mkdir -p $PROJECT/doc/$dir
      mv $PROJECT/$bn/$dir/*  $PROJECT/doc/$dir
      rmdir $PROJECT/$bn/$dir
    done
      mv $PROJECT/$bn/*{txt,maps,diff}* $PROJECT/doc
      rm $PROJECT/$bn/COPYRIGHT
  elif test $bn = "README.merged"; then
    mv $PROJECT/$bn $PROJECT/README
  elif test $bn = "README.merged.nonfree"; then
    mv $PROJECT/$bn $PROJECT-nonfree/README
  elif test $bn = "README.merged.uptex"; then
    mv $PROJECT/$bn $PROJECT-uptex/README
  elif test $bn = "COPYRIGHT.merged"; then
    cp -p $PROJECT/$bn $PROJECT-nonfree/COPYRIGHT
    mv $PROJECT/$bn $PROJECT/COPYRIGHT
  elif test $bn = "ChangeLog.md"; then
    echo
    # mv $PROJECT/$bn $PROJECT/$bn
  else
    echo remove $bn
    rm -rf $PROJECT/$bn
  fi
done

  rm -f $PROJECT/.gitignore
  rmdir $PROJECT/japanese-otf
  rmdir $PROJECT/japanese-otf-uptex
  # sty
  perl -pi.bak -e "s{20\d\d/\d\d/\d\d }{$DATE TeX JP org, }g" $PROJECT/sty/otf.sty
  rm -f $PROJECT/sty/otf.sty.bak
  # release date
  perl -pi.bak -e "s/\\\$RELEASEDATE/$VER/g" $PROJECT/README
  rm -f $PROJECT/README.bak
  perl -pi.bak -e "s/\\\$RELEASEDATE/$VER/g" $PROJECT-nonfree/README
  rm -f $PROJECT-nonfree/README.bak
#  do not make japanese-otf-uptex-*.tar.gz anymore
  rm -rf $PROJECT-uptex
  # make archives
  tar zcf $DIR/$PROJECT-$VER.tar.gz $PROJECT
  tar zcf $DIR/$PROJECT-nonfree-$VER.tar.gz $PROJECT-nonfree
#  tar zcf $DIR/$PROJECT-uptex-$VER.tar.gz $PROJECT-uptex
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
