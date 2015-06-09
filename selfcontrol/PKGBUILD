# Maintainer: mittens2001 <mittens2001@tfwno.gf>

pkgname=selfcontrol
pkgver=0.9
pkgrel=1
pkgdesc="A free and open-source application that lets you block your own access to distracting websites"
_dist=selfcontrol
arch=('any')
url="http://svn.jklmnop.net/projects/SelfControl.html"
license=('GPL' 'PerlArtistic')
depends=('perl-module-build' 'perl-yaml' 'gtk2-perl' 'at' 'ed' 'iptables')
options=('!emptydirs' purge)
source=("http://svn.jklmnop.net/projects/SelfControl/${pkgname}-${pkgver}.tar.gz")
md5sums=('fa5736dc761c647c43f6598d8894b8f5')

build() (
	cd "$srcdir/$_dist-$pkgver"
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
	/usr/bin/perl Build.PL
	./Build
)


check() (
	cd "$srcdir/$_dist-$pkgver"
	# remove sudo atq test, sudo won't work without password
	rm -f t/03-atq.t
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
	./Build test
)


package() (
	cd "$srcdir/$pkgbase-$pkgver"
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	./Build install installdirs=vendor destdir="$pkgdir"
)
