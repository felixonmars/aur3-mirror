# CPAN Name  : CatalystX-SimpleLogin
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 0.18
pkgname='perl-catalystx-simplelogin'
pkgver='0.09'
pkgrel='1'
pkgdesc="Provide a simple Login controller which can be reused"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-catalyst-action-renderview' 'perl-catalyst-action-rest>=0.74' 'perl-catalyst-actionrole-acl' 'perl-catalyst-controller-actionrole>=0.12' 'perl-catalyst-plugin-authentication' 'perl-catalyst-plugin-session>=0.27' 'perl-catalyst-plugin-session-state-cookie' 'perl-catalyst-plugin-session-store-file' 'perl-catalyst-runtime>=5.80013' 'perl-catalyst-view-tt' 'perl-catalystx-component-traits>=0.13' 'perl-catalystx-injectcomponent' 'perl-html-formhandler>=0.28001' 'perl-libwww' 'perl-moose' 'perl-moose-autobox' 'perl-moosex-methodattributes>=0.18' 'perl-moosex-relatedclassroles>=0.004' 'perl-moosex-types' 'perl-moosex-types-common' 'perl-namespace-autoclean' 'perl-sql-translator' 'perl-test-exception' 'perl-test-simple>=0.94')
url='http://search.cpan.org/dist/CatalystX-SimpleLogin'
source=('http://search.cpan.org/CPAN/authors/id/B/BO/BOBTFISH/CatalystX-SimpleLogin-0.09.tar.gz')
md5sums=('71633de5fe4f5ce72b3703bca86750b0')

build() {
  DIST_DIR="${srcdir}/CatalystX-SimpleLogin-0.09"
  export PERL_MM_USE_DEFAULT=1
  { cd "$DIST_DIR" &&
    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&
    make test &&
    make DESTDIR="$pkgdir" install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
