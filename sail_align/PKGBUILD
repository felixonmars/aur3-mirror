# Maintainer: Chris Baume <chris.baume@bbc.co.uk>
pkgname=sail_align
pkgver=1.4.0
pkgrel=1
pkgdesc="SailAlign is an open-source software toolkit for robust long speech-text alignment."
arch=('any')
url="https://github.com/nassosoassos/sail_align"
license=('GPL')
groups=()
depends=('perl' 'perl-libwww' 'perl-archive-extract' 'htk')
makedepends=('perl-module-build')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/nassosoassos/sail_align/archive/v$pkgver.tar.gz)
noextract=()
md5sums=('b5c47df8bd520e2abeb489b25284946d')

build() {
  cd "$pkgname-$pkgver"

  printf '/usr/bin\n' | perl Build.PL --destdir "$pkgdir/"
  printf 'yes\nsudo\n' | ./Build installdeps
  ./Build
}

package() {
  cd "$pkgname-$pkgver"

  ./Build install
}
