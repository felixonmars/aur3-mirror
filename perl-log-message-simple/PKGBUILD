# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 0.16
pkgname='perl-log-message-simple'
pkgver='0.06'
pkgrel='1'
pkgdesc="Simplified interface to Log::Message"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='http://search.cpan.org/dist/Log-Message-Simple'
source=('http://search.cpan.org/CPAN/authors/id/B/BI/BINGOS/Log-Message-Simple-0.06.tar.gz')
md5sums=('bee9416fae39f8cf034ad9da512a6f62')

build() {
  _DISTDIR="${srcdir}/Log-Message-Simple-0.06"
  export PERL_MM_USE_DEFAULT=1
  { cd "$_DISTDIR" &&
    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&
    make test &&
    make DESTDIR="${pkgdir}/" install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
