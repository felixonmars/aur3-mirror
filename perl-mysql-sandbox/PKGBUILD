# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname=perl-mysql-sandbox
pkgver=3.0.25
pkgrel=1
pkgdesc='Quickly installs MySQL side server, either standalone or in groups'
arch=(any)
license=(PerlArtistic GPL)
options=('!emptydirs')
depends=(perl)
url=http://search.cpan.org/dist/MySQL-Sandbox
source=("http://search.cpan.org/CPAN/authors/id/G/GM/GMAX/MySQL-Sandbox-$pkgver.tar.gz")
_distdir="${srcdir}/MySQL-Sandbox-${pkgver}"
md5sums=('04e4ff1567a37a0665aa10e5ef3df0f4')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
