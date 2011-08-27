# Contributor: Victor Petrenko <2g0ga.dp.ua@gmail.com>
pkgname='perl-cgi-application-plugin-forward'
pkgver='1.06'
pkgrel='1'
pkgdesc='Easy runmode change in CGI::Application'
arch=('i686' 'x86_64')
url='http://search.cpan.org/~mgraham/CGI-Application-Plugin-Forward-1.06/'
license=('PerlArtistic' 'GPL')
depends=('perl-cgi-application')
source=("http://search.cpan.org/CPAN/authors/id/M/MG/MGRAHAM/CGI-Application-Plugin-Forward-${pkgver}.tar.gz")
md5sums=('1593ec5a83a7e104e4b85f13cc729a8a')

build() {
  cd "${srcdir}/CGI-Application-Plugin-Forward-${pkgver}"
  (	#PERL_MM_USE_DEFAULT=1
		perl Makefile.PL INSTALLDIRS=vendor &&
	  make &&
	  make test &&
	  make DESTDIR="${pkgdir}/" install
  ) || return 1;

	# Remove directories that only contain .packlist and perllocal.pod.
  rm -r "${pkgdir:?}/usr/lib"
}
