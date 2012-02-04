# $Id$
# Contributer: Barry User <barry@user.com>
# Maintainer: Harry Hacker <harry@hacker.com>

pkgname=perl-dbd-xbase
_realname=Xbase
pkgver=1.07
pkgrel=1
pkgdesc="Xbase - Perl Module to Read Xbase DBF Files and Foxpro IDX indexes"
arch=('any')
url="http://search.cpan.org/dist/${_realname}/"
license=('GPL' 'Artistic')
depends=('perl>=5.10.0')
source=("http://search.cpan.org/CPAN/authors/id/P/PR/PRATP/${_realname}-${pkgver}.tar.gz")
md5sums=("c764226eea37c65ea137c91efb2255b9")
options=(!emptydirs)

build() {
  cd "${srcdir}/${_realname}-${pkgver}"
  # Install module into the vendor directories.
  perl Makefile.PL INSTALLDIRS=vendor
  make
}   

package() {
  cd "${srcdir}/${_realname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Remove .packlist and perllocal.pod files.
  find "${pkgdir}" -name '.packlist' -delete
  find "${pkgdir}" -name 'perllocal.pod' -delete
}
