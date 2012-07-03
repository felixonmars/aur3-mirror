# CPAN Name  : Pod-PseudoPod
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.04
# Template @ http://github.com/xenoterracide/AURpan/blob/master/perl-pod-pseudopod/PKGBUILD.tt
# File bugs @ http://github.com/xenoterracide/AURpan/issues

pkgname='perl-term-termkey0.13'
_realname='Term-TermKey'
_cpanauthor='PEVANS'
pkgver='0.13'
pkgrel='1'
pkgdesc='perl wrapper around libtermkey'
arch=('any')
url='http://search.cpan.org/dist/Term-TermKey/'
license=('PerlArtistic' 'GPL')
depends=('perl' 'libtermkey0.14' 'perl-module-build' 'perl-extutils-pkgconfig')
options=('!emptydirs')

_cpanmirror='http://search.cpan.org/CPAN'
_cpandir='authors/id'
_cpanid="${_cpanauthor:0:1}/${_cpanauthor:0:2}/${_cpanauthor}"

source=(${_cpanmirror}/${_cpandir}/${_cpanid}/${_realname}-${pkgver}.tar.gz)
md5sums=('22afc87cdf220aafae9c7061321d64b6')

build() {
  DIST_DIR="${srcdir}/${_realname}-${pkgver}"
  {
	cd "$DIST_DIR" &&
    perl Build.PL installdirs=vendor destdir="$pkgdir/" &&
    perl Build &&
    perl Build install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
