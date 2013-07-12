pkgname=perl-desktop-notify
_realname=Desktop-Notify
pkgver=0.03
pkgrel=4
pkgdesc="Desktop::Notify - a notification library"
arch=(i686 x86_64)
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/${_realname}/"
depends=('perl>=5.10.0' 'perl-net-dbus>=0.33' 'perl-class-accessor')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/S/SA/SACAVILIA/Desktop-Notify-${pkgver}.tar.gz)
md5sums=('8847fe21dcd8572fec8c4e5f082aa24d')

build() {
  cd ${startdir}/src/${_realname}-${pkgver}

  # install module in vendor directories.
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir"/${_realname}-${pkgver}

  make install DESTDIR="$pkgdir"

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}
