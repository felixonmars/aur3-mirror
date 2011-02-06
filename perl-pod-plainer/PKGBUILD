# CPAN Name  : Pod-Plainer
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 0.20
# Template @ http://github.com/xenoterracide/AURpan/blob/master/perl-pod-plainer/PKGBUILD.tt
# File bugs @ http://github.com/xenoterracide/AURpan/issues

pkgname='perl-pod-plainer'
pkgver='1.02'
pkgrel='2'
pkgdesc="To convert POD to old-style plainer POD."
arch=('any')
url='http://search.cpan.org/dist/Pod-Plainer'
license=('PerlArtistic' 'GPL')
depends=('perl')

options=('!emptydirs')

source=('http://search.cpan.org/CPAN/authors/id/R/RM/RMBARKER/Pod-Plainer-1.02.tar.gz')
md5sums=('0f6b7c7250736ecc3c108522ce98c0e1')

build() {
  DIST_DIR="${srcdir}/Pod-Plainer-1.02"
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

