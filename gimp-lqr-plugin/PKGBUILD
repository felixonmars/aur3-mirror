# Contributor: giacomogiorgianni@gmail.com>

pkgname=gimp-lqr-plugin
pkgver=0.7.1
pkgrel=2
pkgdesc="This plugin aims at resizing pictures non uniformly while preserving their features, i.e. avoiding distortion of the important parts"
url="http://registry.gimp.org/node/144"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gimp>=2.3' 'liblqr')
makedepends=('perl-xml-parser' 'intltool' 'gettext')
source=(http://registry.gimp.org/files/${pkgname}-${pkgver}.tar.bz2)
md5sums=('d7ee28b16bdbd9f46bc9f21cf5deb487')

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  make DESTDIR=${pkgdir} install
}
