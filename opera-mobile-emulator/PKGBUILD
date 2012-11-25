pkgname=opera-mobile-emulator
pkgver=12.1
pkgrel=1
pkgdesc="Opera Mobile emulator is the desktop version of Opera's smart phone browser"
url="http://www.opera.com"
license=('custom:opera')
arch=('i686' 'x86_64')
depends=('gtk2' 'qt' 'freetype2') 
[[ $CARCH == "x86_64" ]] && depends=('lib32-gtk2' 'lib32-qt' 'lib32-freetype2')
source=(http://get.geo.opera.com/pub/opera/sdlbream/1210/Opera_Mobile_Emulator_12.1_Linux_i386.deb)
md5sums=('40546ad35e7934e0beaaf27d6cf86b46')

build() {
  cd $srcdir
  ar p Opera_Mobile_Emulator_12.1_Linux_i386.deb data.tar.gz | tar zx
  rm -rf $srcdir/usr/share/doc/
  sed -i '/NoDisplay/d' $srcdir/usr/share/applications/opera-mobile-emulator.desktop
}
package() {
  cd $srcdir
  cp -r $srcdir/usr $pkgdir/
  find $pkgdir/usr -type f -exec chmod 0644 {} ';'
  chmod 755 $pkgdir/usr/bin/opera-mobile-emulator-launcher
  chmod 755 $pkgdir/usr/bin/opera-mobile-emulator
}
