pkgname=moiosms-beta
pkgver=2.19Bb4
pkgrel=1
pkgdesc="A program to send SMS via web"
url="http://www.moioli.net/forum/viewtopic.php?f=74&t=298&hilit=beta"
license=('GPL2')
arch=('i686' 'x86_64')
makedepends=('unzip')
depends=('gocr' 'ocrad' 'pyqt' 'python-pycurl' 'wxpython')
source=(http://dl.dropbox.com/u/1770135/MoioSMS-2.19Bb4-Source.7z moiosms-beta moiosms-beta.desktop icon.xpm)

md5sums=('5090a1b4d5ee6e158df43ab4b70c8f72'
         'c9af0d84e27de5516ac916ca14afca46'
         'c00c876b73e0aa406362d72b2b012960'
         'eff37215b8657cec67853bf3b420aaed')

build() {
  
  cd $srcdir
  mkdir MoioSMS-Bb4
  cp MoioSMS-2.19Bb4-Source.7z $srcdir/MoioSMS-Bb4/MoioSMS-2.19Bb4-Source.7z
  cd $srcdir/MoioSMS-Bb4
  7z x MoioSMS-2.19Bb4-Source.7z
  rm MoioSMS-2.19Bb4-Source.7z
  cd $srcdir
  
install -Dm755 moiosms-beta $pkgdir/usr/bin/moiosms-beta
install -Dm644 moiosms-beta.desktop $pkgdir/usr/share/applications/moiosms-beta.desktop
install -Dm644 icon.xpm $pkgdir/usr/share/pixmaps/moiosms-beta.xpm

mkdir -p $pkgdir/usr/lib/python2.6/site-packages/MoioSMS-Bb4/moio/errors
mkdir -p $pkgdir/usr/lib/python2.6/site-packages/MoioSMS-Bb4/moio/lib
mkdir -p $pkgdir/usr/lib/python2.6/site-packages/MoioSMS-Bb4/moio/plugins/captchadecoders
mkdir -p $pkgdir/usr/lib/python2.6/site-packages/MoioSMS-Bb4/moio/plugins/senders
mkdir -p $pkgdir/usr/lib/python2.6/site-packages/MoioSMS-Bb4/moio/plugins/uis


install -Dm644 $srcdir/MoioSMS-Bb4/* $pkgdir/usr/lib/python2.6/site-packages/MoioSMS-Bb4/

install -Dm644 $srcdir/MoioSMS-Bb4/moio/* $pkgdir/usr/lib/python2.6/site-packages/MoioSMS-Bb4/moio/

install -Dm644 $srcdir/MoioSMS-Bb4/moio/errors/* $pkgdir/usr/lib/python2.6/site-packages/MoioSMS-Bb4/moio/errors/

install -Dm644 $srcdir/MoioSMS-Bb4/moio/lib/* $pkgdir/usr/lib/python2.6/site-packages/MoioSMS-Bb4/moio/lib/

install -Dm644 $srcdir/MoioSMS-Bb4/moio/plugins/* $pkgdir/usr/lib/python2.6/site-packages/MoioSMS-Bb4/moio/plugins/

install -Dm644 $srcdir/MoioSMS-Bb4/moio/plugins/captchadecoders/* $pkgdir/usr/lib/python2.6/site-packages/MoioSMS-Bb4/moio/plugins/captchadecoders/

install -Dm644 $srcdir/MoioSMS-Bb4/moio/plugins/senders/* $pkgdir/usr/lib/python2.6/site-packages/MoioSMS-Bb4/moio/plugins/senders/

install -Dm644 $srcdir/MoioSMS-Bb4/moio/plugins/uis/* $pkgdir/usr/lib/python2.6/site-packages/MoioSMS-Bb4/moio/plugins/uis/


}
