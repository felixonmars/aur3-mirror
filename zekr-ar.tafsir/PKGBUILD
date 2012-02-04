# Contributor: mutlu_inek <mutlu_inek@yahoo.de>
# Edypt By abauomy@gmail.com

pkgname=zekr-ar.tafsir
pkgver=1.0.0
pkgrel=1
pkgdesc="An open Quranic platform aimed to ease access to the Holy Quran for reading, \
	translating, or researching.(with arabic tafsir)"
url="http://zekr.org/quran/quran-for-linux"
license="GPL"
arch=('i686' 'x86_64')
depends=('java-runtime' 'firefox')
optdepends=('flashplugin :Enable Audio Recitations')
# Sources abd nd5sums for i686
[ "$CARCH" = "i686" ] && source=(http://downloads.sourceforge.net/zekr/zekr-$pkgver-linux.tar.gz http://zekr.org/download/trans/ar.tafsir.jalalayn.trans.zip http://zekr.org/download/trans/ar.tafsir.muyassar.trans.zip zekr.desktop)
[ "$CARCH" = "i686" ] && md5sums=('4727c8b06d6341a2f2f6e552012656c8' '7d7184d3f090edf55db70bb1623138bb' '5119fcb771d36b01fd16787ac4d52ad4' 'c82122b0b8766412fc152dd7cb5f176e')
# Sources and md5sums for x86_64
[ "$CARCH" = "x86_64" ] && source=(http://downloads.sourceforge.net/zekr/zekr-$pkgver-linux_64.tar.gz http://zekr.org/download/trans/ar.tafsir.jalalayn.trans.zip http://zekr.org/download/trans/ar.tafsir.muyassar.trans.zip zekr.desktop)
[ "$CARCH" = "x86_64" ] && md5sums=('92da4b994a70035d4dedef7217646307' '7d7184d3f090edf55db70bb1623138bb' '5119fcb771d36b01fd16787ac4d52ad4' 'c82122b0b8766412fc152dd7cb5f176e')

build() {
  cd $startdir/src/
  cp $startdir/src/ar.tafsir*.zip $startdir/src/zekr/res/text/trans
  mkdir -p $startdir/pkg/usr/share/java/zekr
  cp -r $startdir/src/zekr $startdir/pkg/usr/share/java/
  sed -i 's|#export MOZILLA_FIVE_HOME=/usr/lib/firefox|export MOZILLA_FIVE_HOME=/usr/lib/firefox|' $startdir/src/zekr/zekr.sh
  sed -i 's|DIR_NAME=`dirname $0`|DIR_NAME=/usr/share/java/zekr|' $startdir/src/zekr/zekr.sh
  rm $startdir/pkg/usr/share/java/zekr/zekr.sh
  install -D -m755 $startdir/src/zekr/zekr.sh $startdir/pkg/usr/bin/zekr.sh
  mkdir -p $startdir/pkg/usr/share/pixmaps
  install -D -m644 $startdir/src/zekr/res/image/icon/open-book-128.png $startdir/pkg/usr/share/pixmaps/zekr.png
  mkdir -p $startdir/pkg/usr/share/applications
  install -D -m755 zekr.desktop $startdir/pkg/usr/share/applications/zekr.desktop
}
