# CPAN Name  : Dist-Zilla-Plugin-ReadmeFromPod
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.04
# Template @ http://github.com/xenoterracide/AURpan/blob/master/perl-dist-zilla-plugin-readmefrompod/PKGBUILD.tt
# File bugs @ http://github.com/xenoterracide/AURpan/issues

pkgname='perl-dist-zilla-plugin-readmefrompod'
pkgver='0.12'
pkgrel='1'
pkgdesc="Automatically convert POD to a README for Dist::Zilla"
arch=('any')
url='http://search.cpan.org/dist/Dist-Zilla-Plugin-ReadmeFromPod'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.010' 'perl-dist-zilla' 'perl-io-stringy' 'perl-moose' 'perl-moose-autobox')


options=('!emptydirs')

source=('http://search.cpan.org/CPAN/authors/id/A/AV/AVAR/Dist-Zilla-Plugin-ReadmeFromPod-0.12.tar.gz')
md5sums=('7ff1a38627869bf796f37e19483298ef')

build() {
  DIST_DIR="${srcdir}/Dist-Zilla-Plugin-ReadmeFromPod-0.12"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  {
	cd "$DIST_DIR" &&
    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&
    make test &&
    make DESTDIR="$pkgdir" install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete

}

