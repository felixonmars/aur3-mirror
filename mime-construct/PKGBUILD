# Contributor: Andreas Wagner < Andreas dot Wagner at em dot uni-frankfurt dot de >

pkgname=mime-construct
pkgver=1.11
pkgrel=5
pkgdesc="Construct and mail MIME messages from the command line."
arch=(any)
url="http://www.argon.org/~roderick/"
license=('GPL')
depends=('perl-mime-types' 'perl-proc-waitstat' 'smtp-forwarder')
# install=$pkgname.install
source=(http://www.argon.org/~roderick/$pkgname-$pkgver.tar.gz)

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  perl Makefile.PL
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  make install DESTDIR=${pkgdir}
  ln -s /usr/bin/site_perl/mime-construct ${pkgdir}/usr/bin/mime-construct
}

md5sums=('73834ea780fbea81b89dbd9b2fb54f58')
