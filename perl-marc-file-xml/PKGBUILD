# Contributor: Ben Webb <bjwebb67 at googlemail dot com>
pkgname=perl-marc-file-xml
pkgver=0.93
pkgrel=2
pkgdesc="Work with MARC data encoded as XML"
arch=(any)
url="http://search.cpan.org/~gmcharlt/MARC-XML-0.93/lib/MARC/File/XML.pm"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/G/GM/GMCHARLT/MARC-XML-$pkgver.tar.gz)
md5sums=('3b7b3f188c1434394ee6c8b102d01fdb')

build() {
  cd "$srcdir/MARC-XML-$pkgver"

  # install module in vendor directories.
  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}
