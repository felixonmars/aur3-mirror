# CPAN Name  : Sysadm-Install
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 0.19
pkgname='perl-sysadm-install'
pkgver='0.35'
pkgrel='1'
pkgdesc="Typical installation tasks for system administrators"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-libwww' 'perl-log-log4perl>=1.28' 'perl-termreadkey')
url='http://search.cpan.org/dist/Sysadm-Install'
source=('http://search.cpan.org/CPAN/authors/id/M/MS/MSCHILLI/Sysadm-Install-0.35.tar.gz')
md5sums=('ff17fad54a21ada3ee3829dc0ac32b6c')

build() {
  DIST_DIR="${srcdir}/Sysadm-Install-0.35"
  export PERL_MM_USE_DEFAULT=1
  { cd "$DIST_DIR" &&    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&make test &&
    make DESTDIR="$pkgdir" install;  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

