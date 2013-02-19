# Maintainer: kfgz <kfgz at interia pl>

pkgname=sray
pkgver=0.0.1
pkgrel=1
pkgdesc="Off-line photorealistic global-illumination renderer based on photon mapping."
url="http://sray.googlecode.com/"
license=('GPL3')
arch=(i686 x86_64)
depends=('expat')
makedepends=('pkg-config' 'libimago' 'libvmath' 'kdtree')
source=(http://sray.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('aabae5994ef735eec8ddb237baffbfac')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  sed -i "s/O3/O2/g" Makefile
  sed -i "s/-ffast-math//g" Makefile
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  install -dm755 "${pkgdir}"/usr/{bin,share/sray}
  install -m755 sray "${pkgdir}"/usr/bin
  install -m644 examples/*.xml "${pkgdir}"/usr/share/sray
}