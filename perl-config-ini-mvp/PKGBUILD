# CPAN Name  : Config-INI-MVP
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.02
# Template @ http://github.com/xenoterracide/AURpan/blob/master/perl-config-ini-mvp/PKGBUILD.tt
# File bugs @ http://github.com/xenoterracide/AURpan/issues

pkgname='perl-config-ini-mvp'
pkgver='0.024'
pkgrel='2'
pkgdesc="multi-value capable .ini file reader (for plugins)"
arch=('any')
url='http://search.cpan.org/dist/Config-INI-MVP'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-config-ini' 'perl-config-mvp>=0.092060' 'perl-moose>=0.65')


options=('!emptydirs')

source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Config-INI-MVP-0.024.tar.gz')
md5sums=('887b2664aa36680cdde73095e67e12b4')

build() {
  DIST_DIR="${srcdir}/Config-INI-MVP-0.024"
  export PERL_AUTOINSTALL=--skipdeps PERL_MM_USE_DEFAULT=1
  {
	cd "$DIST_DIR" &&
    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&
    make test &&
    make DESTDIR="$pkgdir" install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete

# remove conflicting files per bug https://rt.cpan.org/Public/Bug/Display.html?id=57844
# please use perl-config-mvp-reader-ini for these files instead
if [ -d "$pkgdir/usr/share/perl5/vendor_perl/Config/MVP/Reader/" ]
	then
		rm "$pkgdir/usr/share/perl5/vendor_perl/Config/MVP/Reader/INI.pm"
		rm "$pkgdir/usr/share/man/man3/Config::MVP::Reader::INI.3pm"
fi
}
