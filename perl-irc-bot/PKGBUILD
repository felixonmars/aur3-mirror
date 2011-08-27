# Maintainer:  <thenoob06@gmail.com>

pkgname=perl-irc-bot
_realname=IRC-Bot
pkgver=0.08
pkgrel=1
pkgdesc="Perl Module:  IRC::Bot-Channel Maintenance IRC Bot"
arch=(i686 x86_64)
license=('PerlArtistic')
url="http://search.cpan.org/~bwsmith/${_realname}-${pkgver}/"
depends=('perl>=5.10.0', 'perl-poe-component-irc','perl-cache')
options=(!emptydirs)
source=(http://www.cpan.org/authors/id/B/BW/BWSMITH/${_realname}-${pkgver}.tar.gz)
md5sums=('1b8c8491fcf13e94ad2be1dbf71646a2') 

build() {
 cd ${startdir}/src/${_realname}-${pkgver}
    # install module in vendor directories.
 PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
 make  || return 1
 make install DESTDIR=${startdir}/pkg || return 1

 # remove perllocal.pod and .packlist
 find ${startdir}/pkg -name perllocal.pod -delete
 find ${startdir}/pkg -name .packlist -delete
}

