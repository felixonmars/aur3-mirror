# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributer: giacomogiorgianni@gmail.com

pkgname=libupstart
pkgver=1.12
pkgrel=3
pkgdesc="Upstart Client Library"
arch=(i686 x86_64)
url="http://upstart.ubuntu.com/"
license=('GPL')
depends=('libnih')
makedepends=('python')
provides=('libupstart')
conflicts=('upstart')
options=(emptydirs)
source=(http://upstart.ubuntu.com/download/${pkgver}/upstart-${pkgver}.tar.gz)
md5sums=('ac28cd1272be5b9b05ac4452676564af')

build() {
  cd "${srcdir}/upstart-${pkgver}"

  ./configure --prefix=/usr --exec-prefix=/ --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/upstart-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "$pkgdir"/{bin,etc,sbin}
  rm -rf "$pkgdir"/usr/{include,share}
}
