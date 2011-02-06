# $Id$
# Contributor: Daniel Golle

pkgname=perl-digest-crc32
_realname=Digest-Crc32
pkgver=0.01
_realver=001
pkgrel=1
pkgdesc="Perl Module: Interface to the CRC32 Algorithm."
arch=(i686 x86_64)
license=('PerlArtistic')
url="http://search.cpan.org/dist/${_realname}/"
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/F/FA/FAYS/${_realname}-${pkgver}.tar.gz)
replaces=('digest-crc32')
provides=('digest-crc32')
md5sums=('4808a7fd130218cd1193d8a496d8ec92')

build() {
  cd ${startdir}/src/${_realname}-${_realver}
  # install module in vendor directories.
  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make  || return 1
  make install DESTDIR=${startdir}/pkg || return 1

  # remove perllocal.pod and .packlist
  find ${startdir}/pkg -name perllocal.pod -delete
  find ${startdir}/pkg -name .packlist -delete
}
