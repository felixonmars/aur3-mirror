# Contributor: kagan <juanynie AT gmail DOT com>
pkgname=xe-bin
pkgver=2.16.2
pkgrel=2
pkgdesc="Xe is a multi system emulator that emulates many console and handheld video game systems of the past."
url="http://www.xe-emulator.com/"
license="custom:as-is"
depends=('libxv' 'libxxf86vm' 'libxinerama' 'zlib' 'gtk2')
makedpends=('pkgconfig')
arch=('i686' 'x86_64')
[ "$CARCH" = "i686"   ] && ARCH=x86-32
[ "$CARCH" = "x86_64" ] && ARCH=x86-64
install=xe-bin.install
source=(http://www.xe-emulator.com/files/xe-$ARCH-bin.$pkgver.tar.bz2 xe.desktop xe.png)
md5sums=('3ea92f686722cde768c0e008bb0b5ec3' 'e17fa0731e5f93e94c3d08555212cca1' 'c3babfea9611560eefce9b744d16a2ab')
[ "$CARCH" = "x86_64" ] && md5sums=('adcf3872f41cd0f0ea1ac28ea90abc00' 'e17fa0731e5f93e94c3d08555212cca1' 'c3babfea9611560eefce9b744d16a2ab')

build() {
  cd $startdir/src/xe-x*/
  sed -i '/strip/d' Makefile
  sed -i '/^CC/d' Makefile
  sed -i '/CC/s/$/ $(LDFLAGS)/' Makefile
  sed -i 's/@//' Makefile
  make || return 1
  mkdir -p $startdir/pkg/usr/{bin,lib/xe}
  cp -R $startdir/src/xe-x*/modules $startdir/pkg/usr/lib/xe/
  cp -R $startdir/src/xe-x*/rc $startdir/pkg/usr/lib/xe/
  cp -R $startdir/src/xe-x*/xe $startdir/pkg/usr/bin/

# Install desktop shortcut
  install -D -m 0644 $startdir/xe.desktop $startdir/pkg/usr/share/applications/xe.desktop

# Install icon
  install -D -m 0644 $startdir/xe.png $startdir/pkg/usr/share/pixmaps/xe.png
}
