# Maintainer: nyxkn <nyxkn [at] yahoo [dot] com>

pkgname=perl-object-pluggable
pkgver=1.29
pkgrel=2
pkgdesc="A base class for creating plugin-enabled objects"
depends=('perl>=5.10.0')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/~hinrik/Object-Pluggable-1.29"
source=(http://search.cpan.org/CPAN/authors/id/H/HI/HINRIK/Object-Pluggable-$pkgver.tar.gz)
md5sums=('25d2c1a2ad5bc129e677738172734a8e')
options=('!emptydirs')
arch=(i686 x86_64)

build()
{
  cd ${srcdir}/Object-Pluggable-$pkgver

  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  # Remove .packlist and perllocal.pod files.
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name 'perllocal.pod' -delete

}

 
