# CPAN Name  : Dist-Zilla-Plugin-CriticTests
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.02
# Template @ http://github.com/xenoterracide/AURpan/blob/master/perl-dist-zilla-plugin-critictests/PKGBUILD.tt
# File bugs @ http://github.com/xenoterracide/AURpan/issues

pkgname='perl-dist-zilla-plugin-critictests'
pkgver='1.100140'
pkgrel='1'
pkgdesc="tests to check your code against best practices"
arch=('any')
url='http://search.cpan.org/dist/Dist-Zilla-Plugin-CriticTests'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-dist-zilla' 'perl-moose')


options=('!emptydirs')

source=('http://search.cpan.org/CPAN/authors/id/J/JQ/JQUELIN/Dist-Zilla-Plugin-CriticTests-1.100140.tar.gz')
md5sums=('8d1ba41a3c573a59320ae83a1be65ce1')

build() {
  DIST_DIR="${srcdir}/Dist-Zilla-Plugin-CriticTests-1.100140"
  export PERL_AUTOINSTALL=--skipdeps PERL_MM_USE_DEFAULT=1 \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  {
	cd "$DIST_DIR" &&
    perl Build.PL --installdirs=vendor --destdir="$pkgdir" &&
    perl Build &&
    perl Build test &&
    perl Build install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete

}

