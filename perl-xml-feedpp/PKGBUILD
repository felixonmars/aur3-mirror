# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=perl-xml-feedpp
pkgver=0.43
pkgrel=1
pkgdesc="Parse/write/merge/edit RSS/RDF/Atom syndication feeds"
depends=('perl>=5.10.0' 'glibc' 'perl-xml-treepp')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/XML-FeedPP"
source=(http://search.cpan.org/CPAN/authors/id/K/KA/KAWASAKI/XML-FeedPP-$pkgver.tar.gz)
options=('!emptydirs')
arch=(i686 x86_64)

build()
{
  cd ${srcdir}/XML-FeedPP-$pkgver

  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  # Remove .packlist and perllocal.pod files.
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name 'perllocal.pod' -delete

}

md5sums=('f9f2876a801a02c9497194ced1b021b9')
