# Maintainer: Archie <xMickael@ifrance.com>

pkgname=tk-matchentry
pkgver=0.4
pkgrel=3
pkgdesc="Entry widget with advanced auto-completion capability"
depends=('tk' 'perl-tk')
arch=('i686')
license=('GPL')
source=(http://search.cpan.org/CPAN/authors/id/W/WH/WHOM/Tk-MatchEntry-$pkgver.tar.gz)
url="http://search.cpan.org/~whom/Tk-MatchEntry/"
md5sums=('aad058937866810a67e973d24a8a8380')

build() {
	cd $startdir/src/Tk-MatchEntry-$pkgver
	perl Makefile.PL
	make || return 1
	make DESTDIR=$startdir/pkg/ install
	# remove perllocal.pod and .packlist
	find ${startdir}/pkg -name perllocal.pod -delete
	find ${startdir}/pkg -name .packlist -delete
	}
