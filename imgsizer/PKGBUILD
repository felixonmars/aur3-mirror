# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Jan Blazek <appolito@gmail.com>

pkgname=imgsizer
pkgver=2.8
pkgrel=1
pkgdesc="A tool to generate or correct WIDTH and HEIGHT parameters into HTML IMG tags"
arch=('any')
url="http://catb.org/~esr/imgsizer/"
license=('BSD')
depends=('file' 'imagemagick' 'python2')
source=("http://catb.org/~esr/imgsizer/${pkgname}-${pkgver}.tar.gz")
md5sums=('6eafdc742b9c7ba17094a2b790d926cc')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Python 2 fix
  sed -i "s_/usr/bin/python_&2_" ${pkgname}

  install -Dm775 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 ${pkgname}.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
