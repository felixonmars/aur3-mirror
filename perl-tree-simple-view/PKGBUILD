# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=perl-tree-simple-view
pkgver=0.17
pkgrel=1
pkgdesc="A set of classes for viewing Tree::Simple hierarchies"
depends=('perl>=5.10.0' 'glibc' 'perl-test-longstring' 'perl-class-throwable' 'perl-test-exception' 'perl-tree-simple')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/Tree-Simple-View"
source=(http://search.cpan.org/CPAN/authors/id/S/ST/STEVAN/Tree-Simple-View-$pkgver.tar.gz)
md5sums=('69aea99d174a89d04455e6d6c322c7b6')
options=('!emptydirs')
arch=(i686 x86_64)

build()
{
  cd ${srcdir}/Tree-Simple-View-$pkgver

  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  # Remove .packlist and perllocal.pod files.
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name 'perllocal.pod' -delete

}

