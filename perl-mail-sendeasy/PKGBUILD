#
# Contributor: Elen V. Chistyakova <miralita@gmail.com>
#

pkgname=perl-mail-sendeasy
pkgver=1.2
pkgrel=1
pkgdesc="Mail::SendEasy - Send plain/html e-mails through SMTP servers (platform independent). Supports SMTP authentication and attachments."
url="http://search.cpan.org/~gmpassos/Mail-SendEasy-1.2/lib/Mail/SendEasy.pm"
license="GPL"
depends=('perl')
arch=('i686' 'x86_64')
md5sums=('260b7e62abcd7d75499f0dd762308ea9')

source=(http://search.cpan.org/CPAN/authors/id/G/GM/GMPASSOS/Mail-SendEasy-$pkgver.tar.gz)

build() {
	cd $startdir/src/Mail-SendEasy-$pkgver

	/usr/bin/perl Makefile.PL \
		INSTALLARCHLIB=/usr/lib/perl5/current/${archname}
		INSTALLSITELIB=/usr/lib/perl5/site_perl/current \
		INSTALLSITEARCH=/usr/lib/perl5/site_perl/current/${archname}

	/usr/bin/make || return 1
	/usr/bin/make DESTDIR=$startdir/pkg install
	/usr/bin/find $startdir/pkg -name '.packlist' -exec rm '{}' \;
	/usr/bin/find $startdir/pkg -name 'perllocal.pod' -exec rm '{}' \;
}
