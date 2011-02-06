# CPAN Name  : Dist-Zilla-Plugin-Repository
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.00
# Template @ http://github.com/xenoterracide/AURpan/blob/master/perl-dist-zilla-plugin-repository/PKGBUILD.tt
# File bugs @ http://github.com/xenoterracide/AURpan/issues

pkgname='perl-dist-zilla-plugin-repository'
pkgver='0.13'
pkgrel='1'
pkgdesc="Automatically sets repository URL from svn/svk/Git checkout for Dist::Zilla"
arch=('any')
url='http://search.cpan.org/dist/Dist-Zilla-Plugin-Repository'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-dist-zilla>=2.101310')


options=('!emptydirs')

source=('http://search.cpan.org/CPAN/authors/id/F/FA/FAYLAND/Dist-Zilla-Plugin-Repository-0.13.tar.gz')
md5sums=('aad525729ad033077294b53f74881bf2')

build() {
  DIST_DIR="${srcdir}/Dist-Zilla-Plugin-Repository-0.13"
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

