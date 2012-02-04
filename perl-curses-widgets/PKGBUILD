# Contributor: Heikki Mehtänen <heikki at mehtanen dot fi>

pkgname=perl-curses-widgets
_realname=CursesWidgets
pkgver=1.997
pkgrel=1
pkgdesc="Perl/CPAN Curses::Widgets - Base widget class for use with the Curses::Application framework"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/${_realname}/"
license=('PerlArtistic')
depends=('perl>=5.10.0' 'perl-curses>=1.27')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/C/CO/CORLISS/${_realname}-$pkgver.tar.gz)
md5sums=('142b14bb761f579f98b4266405f06f8a')

build() {
	cd $srcdir/${_realname}-$pkgver/
	
	# install module in vendor directories
	perl Makefile.PL INSTALLDIRS=vendor || return 1
        make || return 1
        make DESTDIR=$pkgdir install || return 1
	
	# remove perllocal.pod and .packlist
	find $pkgdir -name perllocal.pod -delete
	find $pkgdir -name .packlist -delete
}
