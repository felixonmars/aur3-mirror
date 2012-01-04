# Original Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Original Maintainer: Tocer Deng <tocer.deng>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Guillem Rieu <guillemr@gmx.net>

pkgname=python3-lxml
pkgver=2.3.3
pkgrel=1
pkgdesc="Pythonic binding for the libxml2 and libxslt libraries"
arch=('i686' 'x86_64')
license=('BSD' 'GPL' 'custom')
url="http://lxml.de/"
depends=('python3' 'libxml2' 'libxslt')
#source=(http://lxml.de/files/lxml-$pkgver.tgz)
source=(http://pypi.python.org/packages/source/l/lxml/lxml-$pkgver.tar.gz)
md5sums=('a7825793c69d004f388ec6600bad7a6f')

package() {
  cd "${srcdir}/lxml-$pkgver"

  python setup.py install --root="${pkgdir}" --optimize=1

  install -D -m644 "LICENSES.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSES.txt"
  install -D -m644 "doc/licenses/BSD.txt" "${pkgdir}/usr/share/licenses/$pkgname/BSD.txt"
  install -D -m644 "doc/licenses/elementtree.txt" "${pkgdir}/usr/share/licenses/$pkgname/elementtree.txt"
}
