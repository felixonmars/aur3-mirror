# CPAN Name  : Test-Inline
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.00
# Template @ http://github.com/xenoterracide/AURpan/blob/master/perl-test-inline/PKGBUILD.tt
# File bugs @ http://github.com/xenoterracide/AURpan/issues

pkgname='perl-test-inline'
pkgver='2.211'
pkgrel='1'
pkgdesc="Embed your tests in your code, next to what is being tested"
arch=('any')
url='http://search.cpan.org/dist/Test-Inline'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-algorithm-dependency>=1.02' 'perl-class-autouse>=1.29' 'perl-config-tiny>=2.00' 'perl-file-chmod>=0.31' 'perl-file-find-rule>=0.26' 'perl-file-flat>=1.00' 'perl-file-remove>=0.37' 'perl-file-slurp>=9999.04' 'perl-params-util>=0.21' 'perl-pod-tests>=0.18' 'perl-test-classapi>=1.02' 'perl-test-script>=1.02')


options=('!emptydirs')

source=('http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/Test-Inline-2.211.tar.gz')
md5sums=('214c841a80f9650dd6b73c422221a22d')

build() {
  DIST_DIR="${srcdir}/Test-Inline-2.211"
  export PERL_AUTOINSTALL=--skipdeps PERL_MM_USE_DEFAULT=1
  {
	cd "$DIST_DIR" &&
    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&
    make test &&
    make DESTDIR="$pkgdir" install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

