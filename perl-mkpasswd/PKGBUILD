# $ID: PKGBUILD 001 2008-08-06 11:59 umej $
# Maintainer:  Ulfar Johnson <ulfar.johnson@skyrr.is>
# Contriburtor:  Ulfar Johnson <ulfar.johnson@skyrr.is>

pkgname=perl-mkpasswd
_realname=String-MkPasswd
pkgver=0.02
pkgrel=1
pkgdesc="Perl module for password creation"
arch=(i686 x86_64)
license=('unknown')
url="http://search.cpan.org/dist/${_realname}/"
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/C/CG/CGRAU/${_realname}-${pkgver}.tar.gz)
md5sums=('99dc6ba3be883d8d31d132e1ed9108a8')

build () {
	cd ${startdir}/src/${_realname}-${pkgver}
	# install module in vendor directories.
	perl Makefile.PL INSTALLDIRS=vendor || return 1
	make || return 1
	make install DESTDIR=${startdir}/pkg || return 1

  # remove perllocal.pod and .packlist
  find ${startdir}/pkg -name perllocal.pod -delete
  find ${startdir}/pkg -name .packlist -delete
	}

# vim:set ts=2 sw=2 et:
