# Contributor: Thomas Schneuder <maxmusterm@gmail.com>
# Maintainer: Thomas Schneider <maxmusterm@gmail.com>

pkgname=perl-gtp
_realname=Games-Go-GTP
pkgver=0.04
pkgrel=1
pkgdesc="Interact with a server or Go playing program using GTP"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/${_realname}/"
depends=('perl>=5.10.0')
license=('GPL')
source=(http://www.cpan.org/authors/id/D/DE/DEG/${_realname}-${pkgver}.tar.gz)
options=(!emptydirs)
md5sums=(89bc9ede90604a411913b6adbb70a6f3)

build() {
  cd  ${startdir}/src/${_realname}-${pkgver}
  # install module in vendor directories.
  /usr/bin/perl Makefile.PL INSTALLDIRS=vendor || return 1
  /usr/bin/make || return 1
  /usr/bin/make DESTDIR=${startdir}/pkg install

  # remove *.pod, .packlist, and empty dirs:
  find ${startdir}/pkg -name perllocal.pod -delete
  find ${startdir}/pkg -name .packlist -delete
}

sha1sums=('692297853bd4d1564a3e9739235a8d851c0b90cb')

