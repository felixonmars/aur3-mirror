# Contributor: Murtuza Akhtari <inxsible at gmail dot com>

pkgname=rmconverter
pkgver=3.0
pkgrel=1
pkgdesc="A gui for the mencoder and lame packages to generate wav and mp3 formats from real media files (ra, rm, and ram)"
arch=('i686' 'x86_64')
url="https://launchpad.net/rmconverter"
license=('GPL')
depends=('mplayer' 'lame' 'codecs' 'java-runtime')
source=(http://www.dudesblog.net/wwwdudesblognet/downloads/Real%20Media%20Converter/version_3/rmc-3.0_binary.tar.gz
	$pkgname.sh)
md5sums=('de32b2917221e0fd29ad87c6391123a6'
         '9d2b7060a810d71c88225d89640d77a7')		 


build() {
  cd $srcdir/rmc-3.0
  install -d $pkgdir/usr/share/{java/,}$pkgname
  install -m644 $pkgname.jar lib/log4j.jar $pkgdir/usr/share/java/$pkgname
  cp -r bin doc $pkgdir/usr/share/$pkgname
  install -m644 log4j.properties readme.txt $pkgdir/usr/share/$pkgname
  install -D -m755 ../$pkgname.sh $pkgdir/usr/bin/$pkgname

}
