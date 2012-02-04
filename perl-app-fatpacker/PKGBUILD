# Maintainer: Sergey Konoplev <gray.ru@gmail.com>
pkgname=perl-app-fatpacker
pkgver=0.009006
pkgrel=1
pkgdesc="App::FatPacker - pack your dependencies bonto your script file."
url="http://search.cpan.org/perldoc?App::FatPacker"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('perl')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install='perl-app-fatpacker.install'
source=("http://search.cpan.org/CPAN/authors/id/D/DG/DGL/App-FatPacker-${pkgver}.tar.gz")
md5sums=('9a7be5c124e042fe39af2df5efdfd8df')

build() {
  cd "${srcdir}/App-FatPacker-${pkgver}"
  perl Makefile.PL
  make
}

package() {
  cd "${srcdir}/App-FatPacker-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et: