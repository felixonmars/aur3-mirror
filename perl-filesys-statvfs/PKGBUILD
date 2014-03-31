# Maintainer: Somasis <somasissounds@gmail.com>

pkgname='perl-filesys-statvfs'
pkgver='0.82'
pkgrel='1'
pkgdesc="Interface to the statvfs() system call"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
url='http://search.cpan.org/dist/Filesys-Statvfs'
source=('http://search.cpan.org/CPAN/authors/id/I/IG/IGUTHRIE/Filesys-Statvfs-0.82.tar.gz')
md5sums=('133d3f4ad285572b66ca4e5ab42a33a0')
sha512sums=('4c62a73b8c4066f7d182e0810b508743a766e708ac5bf52ded8a1f271b95ceab546d10d78d5ca9719c1d50c5b729ceb3e8a1b56950d2abf559080e52a2f9d22e')
_distdir="Filesys-Statvfs-0.82"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
