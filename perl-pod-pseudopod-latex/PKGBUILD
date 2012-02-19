# CPAN Name  : Pod-PseudoPod
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.04
# Template @ http://github.com/xenoterracide/AURpan/blob/master/perl-pod-pseudopod/PKGBUILD.tt
# File bugs @ http://github.com/xenoterracide/AURpan/issues

pkgname='perl-pod-pseudopod-latex'
_realname='Pod-PseudoPod-LaTeX'
_cpanauthor='CHROMATIC'
pkgver='1.20110710'
pkgrel='2'
pkgdesc="Convert Pod::PseudoPod documents into LaTeX"
arch=('any')
url='http://search.cpan.org/dist/Pod-PseudoPod-LaTeX'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-pod-pseudopod>=0.16' 'perl-io-string')
makedepends=('perl-module-build>=0.3601' 'perl-test-simple>=0.60')
options=('!emptydirs')

_cpanmirror='http://search.cpan.org/CPAN'
_cpandir='authors/id'
_cpanid="${_cpanauthor:0:1}/${_cpanauthor:0:2}/${_cpanauthor}"

source=(${_cpanmirror}/${_cpandir}/${_cpanid}/${_realname}-${pkgver}.tar.gz)
md5sums=('bef5c3d6a128cfd10b5e822facf34172')

build() {
  DIST_DIR="${srcdir}/${_realname}-${pkgver}"
  export PERL_AUTOINSTALL=--skipdeps PERL_MM_USE_DEFAULT=1 \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  {
	cd "$DIST_DIR" &&
    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&
    make test &&
    make DESTDIR="$pkgdir" install
  } || return 1;

  find "$pkgdir" -name perllocal.pod -delete
}
