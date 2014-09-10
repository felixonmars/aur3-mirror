# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-net-dhcp'
pkgver='0.693'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.0')
makedepends=()
checkdepends=('perl-test-warn')
url='http://search.mcpan.org/dist/Net-DHCP'
source=('http://search.mcpan.org/CPAN/authors/id/D/DJ/DJZORT/Net-DHCP-0.693.tar.gz')
md5sums=('ec94467b47b9e29ca84116289fc2c9b1')
sha512sums=('1c840c370b1cef84196676eacacafcc3eed5bcba3b67a79ee82d76fe31c86f12b90a520f2d9bcec4435d30088737f6d686c5682ca0efac19686774a9b7e3ef74')
_distdir="Net-DHCP-0.693"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
