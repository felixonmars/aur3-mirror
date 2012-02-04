# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>

pkgname=blender-bin
# Please blender, stick to one way of naming your versions
pkgver=2.58a
_pkgver=2.58
pkgrel=1
pkgdesc="A fully integrated 3D graphics creation suite (binary version)"
arch=('i686' 'x86_64')
url="http://blender.org/"
license=('GPL')
depends=('freetype2' 'sdl' 'libgl' 'mesa')
provides=('blender')
conflicts=('blender')
install=blender.install
source=('blender.desktop' 'blender.sh')
md5sums=('b5b9720b9430b1f5e2aa0b2df533fed8'
         'ee1723515be5a2a88839fe02c1eaf174')

case ${CARCH} in
  i686)
    source=(${source[@]} "http://download.blender.org/release/Blender$_pkgver/blender-$pkgver-linux-glibc27-i686.tar.bz2")
    md5sums=(${md5sums[@]} 'ae6047db618eed781c7cd1a07f14c47a')
    ;;
  x86_64)
    source=(${source[@]} "http://download.blender.org/release/Blender$_pkgver/blender-$pkgver-linux-glibc27-x86_64.tar.bz2")
    md5sums=(${md5sums[@]} '2d58a9eda0fd083b3008c87ed556c5d7')
    ;;
esac

build() {
  case ${CARCH} in
    i686)
      cd "$srcdir/blender-$pkgver-linux-glibc27-i686"
      ;;
    x86_64)
      cd "$srcdir/blender-$pkgver-linux-glibc27-x86_64"
      ;;
  esac

  install -d -m755 $pkgdir/usr/share/blender

  install -Dm755 "$srcdir/blender.sh" "$pkgdir/usr/bin/blender"
  cp -r blender ${_pkgver} "$pkgdir/usr/share/blender"

  # Icons
  install -m755 -d "$pkgdir/usr/share/icons"
  cp -r icons "$pkgdir/usr/share/icons/hicolor"

  # Stolen from blender in extra
  install -Dm644 $srcdir/blender.desktop $pkgdir/usr/share/applications/blender.desktop
}

# vim:set ts=2 sw=2 et:
