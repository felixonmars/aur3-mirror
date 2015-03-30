# Maintainer : Matthew Longley <randomticktock@gmail.com>

pkgname=perl-file-temp
pkgver=0.2304
pkgrel=1
pkgdesc="return name and handle of a temporary file safely"
arch=('any')
url="https://metacpan.org/release/File-Temp/"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-extutils-makemaker-aur')
options=('!emptydirs')
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/File-Temp-0.2304.tar.gz')
sha256sums=('13415323e48f7c9f34efdedf3d35141a7c3435e2beb8c6b922229dc317d321ac')

build() {
    cd "$srcdir/File-Temp-$pkgver";
    
    export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--alldeps \
	   PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
	   PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
	   PERL5LIB="" PERL_LOCAL_LIB_ROOT="" \
	   MODULEBUILDRC=/dev/null;

    perl Makefile.PL || return 1;
    make || return 1;
}

check() {
  cd "$srcdir/File-Temp-$pkgver";
  make test || return 1;
}

package() {
  cd "$srcdir/File-Temp-$pkgver";
  make install || return 1
}
