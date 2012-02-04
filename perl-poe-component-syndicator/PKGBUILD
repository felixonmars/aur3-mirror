# Maintainer: nyxkn <nyxkn [at] yahoo [dot] com>

pkgname=perl-poe-component-syndicator
pkgver=0.06
pkgrel=1
pkgdesc="A POE component base class which implements the Observer pattern"
depends=('perl>=5.10.0')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/~hinrik/POE-Component-Syndicator-0.06"
source=(http://search.cpan.org/CPAN/authors/id/H/HI/HINRIK/POE-Component-Syndicator-$pkgver.tar.gz)
md5sums=('dfa8019122225d9853263293002ff29b')
options=('!emptydirs')
arch=(i686 x86_64)

build()
{
  cd ${srcdir}/POE-Component-Syndicator-$pkgver

  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  # Remove .packlist and perllocal.pod files.
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name 'perllocal.pod' -delete

}

 
