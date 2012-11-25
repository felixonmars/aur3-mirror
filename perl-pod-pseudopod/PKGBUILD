# CPAN Name  : Pod-PseudoPod
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.04
# Template @ http://github.com/xenoterracide/AURpan/blob/master/perl-pod-pseudopod/PKGBUILD.tt
# File bugs @ http://github.com/xenoterracide/AURpan/issues

pkgname='perl-pod-pseudopod'
_realname='Pod-PseudoPod'
_cpanauthor='CHROMATIC'
pkgver='0.18'
pkgrel='1'
pkgdesc="A framework for parsing PseudoPod"
arch=('any')
url='http://search.cpan.org/dist/Pod-PseudoPod'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-html-parser')
options=('!emptydirs')

_cpanmirror='http://search.cpan.org/CPAN'
_cpandir='authors/id'
_cpanid="${_cpanauthor:0:1}/${_cpanauthor:0:2}/${_cpanauthor}"

source=(${_cpanmirror}/${_cpandir}/${_cpanid}/${_realname}-${pkgver}.tar.gz)
md5sums=('c6c3453225e9bc1a662c2ea4a2180530')

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
    make DESTDIR="$pkgdir" install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete

}
