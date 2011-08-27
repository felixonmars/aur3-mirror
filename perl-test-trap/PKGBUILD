# Contributor: Erik Johnson (archtaku at gmail dot com)
pkgname="perl-test-trap"
pkgver=0.2.1
pkgrel=1
pkgdesc="Trap exit codes, exceptions, output, etc."
arch=('any')
url="http://search.cpan.org/~ebhanssen/Test-Trap-v0.2.1/lib/Test/Trap.pm"
license=('GPL Artistic')
depends=('perl>=5.10.0' 'perl-test-tester' 'perl-data-dump')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://search.cpan.org/CPAN/authors/id/E/EB/EBHANSSEN/Test-Trap-v${pkgver}.tar.gz")
md5sums=('f52186c2cb278af91ac5743abe00e97b')

build() {
  cd "$srcdir/Test-Trap-v$pkgver"

  # install module in vendor directories.
  perl Build.PL installdirs=vendor || return 1
  ./Build || return 1
  ./Build test || return 1
  ./Build install destdir="$pkgdir/" || return 1
}

# vim:set ts=2 sw=2 et:
