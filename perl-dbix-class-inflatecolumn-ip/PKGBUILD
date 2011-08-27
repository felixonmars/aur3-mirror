# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 0.16
pkgname='perl-dbix-class-inflatecolumn-ip'
pkgver='0.02001'
pkgrel='1'
pkgdesc="Auto-create NetAddr::IP objects from columns."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-dbix-class>=0.07005' 'perl-netaddr-ip')
url='http://search.cpan.org/dist/DBIx-Class-InflateColumn-IP'
source=('http://search.cpan.org/CPAN/authors/id/I/IL/ILMARI/DBIx-Class-InflateColumn-IP-0.02001.tar.gz')
md5sums=('fcfe609f94e0d22a386f940b7b4d56e9')

build() {
  _DISTDIR="${srcdir}/DBIx-Class-InflateColumn-IP-0.02001"
  export PERL_MM_USE_DEFAULT=1
  { cd "$_DISTDIR" &&
    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&
    make test &&
    make DESTDIR="${pkgdir}/" install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
