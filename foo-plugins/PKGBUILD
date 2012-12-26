# Maintainer: William Light <wrl at illest dot net>

pkgname=foo-plugins
pkgver=1.2
pkgrel=1
pkgdesc="foo-plugins is a collection of LADSPA plugins (mostly distortions)."
arch=('i686' 'x86_64')
url="http://code.google.com/p/foo-plugins/"
license=('GPLv2')
depends=()
makedepends=('perl-xml-parser')
source=(http://foo-plugins.googlecode.com/files/$pkgname-$pkgver.tar.bz2)

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # /usr/lib/ladspa is hardcoded in the Makefile
  # so let's prefix it with ${pkgdir}
  sed -ie "s/\/usr\/lib\/ladspa/${pkgdir//\//\\/}\/usr\/lib\/ladspa/" Makefile

  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  mkdir -p ${pkgdir}/usr/lib/ladspa
  make install
}

md5sums=('b4234a0f692f4e754463edadbf5f5a03')
sha1sums=('a64573fce8d94946d25b3d0ef951488ab7862eda')
