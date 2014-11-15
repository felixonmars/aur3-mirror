# Maintainer: Daniel Nienhaus <daniel@flying-sheep.com>

pkgname=fontbuilder-git
pkgver=20140617
pkgrel=1
pkgdesc="Utility for creating texture atlases with bitmap chars from FreeType, TrueType and some other font formats."
url="https://github.com/andryblack/fontbuilder"
arch=("i686" "x86_64")
license=("MIT")
depends=("qt5-base")
makedepends=("git")
source=("fontbuilder-git::git+https://github.com/andryblack/fontbuilder.git" "LICENSE" "$pkgname.desktop")
sha256sums=("SKIP" "48f7fac7bf22571aff1b60462f1713f5dd5cec7eb78dbeefab8708c2a7aa80e0" "a4d3fc0144e6639762a79ec28697645683da81a7e7f021152e2ad50fce7fdf58")

pkgver() {
  cd "$pkgname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd "$srcdir/$pkgname"
  qmake
  make
}

package() {
  install -Dm755 "$srcdir/$pkgname/bin/FontBuilder" "$pkgdir/usr/bin/FontBuilder"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"  
}

