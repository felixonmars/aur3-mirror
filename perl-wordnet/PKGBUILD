# Contributor: DaNiMoTh <jjdanimoth@gmail.com>

pkgname=perl-wordnet
pkgver=1.49
pkgrel=1
pkgdesc="Perl interface to wordnet database"
depends=('perl>=5.10.0' 'glibc' 'wordnet')
license=('GPL')
url="http://people.csail.mit.edu/jrennie/WordNet/"
source=(http://people.csail.mit.edu/jrennie/WordNet/WordNet-QueryData-${pkgver}.tar.gz)
arch=(i686 x86_64 ppc)

build()
{
  cd ${srcdir}/WordNet-QueryData-${pkgver}

  WNHOME=/usr/share/wordnet perl Makefile.PL || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  # Remove .packlist and perllocal.pod files.
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name 'perllocal.pod' -delete

}

md5sums=('887135ef2b2191a120c7bda532124d1f')
