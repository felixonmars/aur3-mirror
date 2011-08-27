# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/Perl_Package_Guidelines for more
# information on Perl packaging.

# Contributor: Neil Munro <neilmunro@gmail.com>
pkgname=html-mason
pkgver=1.42
pkgrel=1
pkgdesc="Mason is a powerful Perl-based web site development and delivery engine. With Mason you can embed Perl code in your HTML and construct pages from shared, reusable components. Mason solves the common problems of site development: caching, debugging, templating, maintaining development and production sites, and more. Mason is 100% free and open source. Although it can be used from CGI or even stand-alone, it is optimally designed for use with two other open source technologies: mod_perl and Apache."
arch=( 'any' )
url="http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/HTML-Mason-1.42.tar.gz"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
provides=( 'html-mason' )
conflicts=( 'html-mason' )
source=( 'http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/HTML-Mason-1.42.tar.gz' )
md5sums=( '5fe5555ebb4bd6929eb6438e0f709355' )

build() {
  cd "$srcdir/HTML-Mason-$pkgver"

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make install DESTDIR="$pkgdir/" || return 1

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}
