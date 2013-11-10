# Maintainer: Anton Larionov <diffident dot cat at gmail dot com>
# Contributor: Linus Sjögren <thelinx@unreliablepollution.net>

pkgname=unrpa
pkgver=1.4
pkgrel=1
pkgdesc="A script to extract files from archives created for the Ren'Py Visual Novel Engine"
arch=('any')
url='http://www.lattyware.co.uk/projects/unrpa/'
license=('GPL')
depends=('python2')
source=("http://www.lattyware.co.uk/projects/${pkgname}-${pkgver}.zip")
md5sums=('5c46777dad77ff3310c63ff0cf26acf6')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 unrpa "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
