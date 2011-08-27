# Contributor: Jon Sturm <jasturm002@aol.com>
pkgname=flashbook
pkgver=1.0beta4
pkgrel=1
pkgdesc="Flashbook is a system for creating and reading electronic texts ("eBooks") on the Texas Instruments TI-83 Plus and TI-84 Plus graphing calculators. "
arch=(i686 x86_64)
url="http://sourceforge.net/projects/flashbook"
license=('GPL')
depends=(gtk2 expat gmp hyphen)
optdepends=('gucharmap: font editor, requires rebuild')
provides=()
conflicts=()
source=(http://downloads.sourceforge.net/project/flashbook/flashbook/1.0beta4/flashbook-1.0beta4.tar.gz)
md5sums=('ea7c3ec8471bcb7fe60f3e1c246a0e94')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
