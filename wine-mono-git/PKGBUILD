# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>

pkgname=wine-mono-git
_pkgname=wine-mono
pkgver=4.5.2
pkgrel=1
pkgdesc="Wine's built-in replacement for Microsoft's .NET Framework"
arch=('i686' 'x86_64')
url="http://wiki.winehq.org/Mono"
license=(GPL LGPL2 MPL)
depends=('wine')
makedepends=(mingw32-gcc mono bc)
options=(!buildflags)
source=('git+https://github.com/madewokherd/wine-mono.git')
sha512sums=('SKIP')

pkgver() {
  cd "$SRCDEST/${_pkgname}"
  git describe --always | cut -f3 -d"-"
}

build() {
  cd "$srcdir/${_pkgname}"
  git submodule update --recursive
  source build-winemono.sh -m i486-mingw32 -M i486-mingw32
}

package () {
  cd "$srcdir/${_pkgname}"
  install -Dm664 winemono.msi "$pkgdir/usr/share/wine/mono/$pkgname-$pkgver.msi"
}
