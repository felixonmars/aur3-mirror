# Maintainer: Danny Arnold  <despairblue@skeil.de>
pkgname=cauto-git
pkgver=r5.b8ca4b6
pkgrel=1
pkgdesc="CAuto is a simple command line tool for automatic compile and link C++ projects."
url="https://github.com/lehmann7/cauto"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('gcc' 'cmake' 'make')
source=($pkgname::git://github.com/lehmann7/${pkgname%-*}.git)
sha512sums=('SKIP')

pkgver() {
	cd $pkgname/
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}/"
  make PREFIX="${pkgdir}" install
  # install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
