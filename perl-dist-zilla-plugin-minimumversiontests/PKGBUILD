# CPAN Name  : Dist-Zilla-Plugin-MinimumVersionTests
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.02
# Template @ http://github.com/xenoterracide/AURpan/blob/master/perl-dist-zilla-plugin-minimumversiontests/PKGBUILD.tt
# File bugs @ http://github.com/xenoterracide/AURpan/issues

pkgname='perl-dist-zilla-plugin-minimumversiontests'
pkgver='1.101421'
pkgrel='1'
pkgdesc="Release tests for minimum required versions"
arch=('any')
url='http://search.cpan.org/dist/Dist-Zilla-Plugin-MinimumVersionTests'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-dist-zilla' 'perl-moose' 'perl-test-minimumversion')


options=('!emptydirs')

source=('http://search.cpan.org/CPAN/authors/id/M/MA/MARCEL/Dist-Zilla-Plugin-MinimumVersionTests-1.101421.tar.gz')
md5sums=('4507b054d200d44efdd00c5a01754ee4')

build() {
  DIST_DIR="${srcdir}/Dist-Zilla-Plugin-MinimumVersionTests-1.101421"
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

