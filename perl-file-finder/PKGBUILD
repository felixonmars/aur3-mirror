# Contributor: Kaushal M <kshlmster@gmail.com>

pkgname=perl-file-finder
_realname=File-Finder
pkgver=0.53
pkgrel=3
pkgdesc="Perl/CPAN Module File::Finder"
arch=('i686' 'x86_64')
license=('unknown')
url="http://search.cpan.org/~merlyn/File-Finder-0.53/"
depends=('perl')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/M/ME/MERLYN/${_realname}-${pkgver}.tar.gz)
md5sums=('92898b39fc36e4a8c82e8c0484e29271')

build() {
  cd $srcdir/${_realname}-$pkgver
  # install module in vendor directories.
  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make  || return 1
}

package() {
  cd $srcdir/${_realname}-$pkgver

  make install DESTDIR=${pkgdir} || return 1
  # remove perllocal.pod and .packlist
  find $pkgdir -name perllocal.pod -delete
  find $pkgdir -name .packlist -delete
}
