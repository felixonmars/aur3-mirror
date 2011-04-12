# Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>

pkgname=cdlib-utils
pkgver=0.2
pkgrel=1
pkgdesc='A CLI frontend to cdlib-eject with indexing and text-based search facilities.'
arch=('any')
url='http://cryptocrack.de/projects/#cdlib-utils'
license=('BSD')
depends=('cdlib-eject')
source=("http://cryptocrack.de/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('e1e2ecf9228a5fb3ebe25b492a74dd8e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make PREFIX=/usr DESTDIR="${pkgdir}" install

  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
