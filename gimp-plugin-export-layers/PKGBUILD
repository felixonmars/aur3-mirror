# Maintainer: James Reed <supplantr at archlinux dot info>

pkgname=gimp-plugin-export-layers
pkgver=20110630
pkgrel=1
pkgdesc='Saves the layers of an image as separate files in a specified directory.'
arch=('i686' 'x86_64')
url='http://registry.gimp.org/node/25394'
license=('MIT')
depends=('gimp')
source=('http://registry.gimp.org/files/export-layers.scm')
md5sums=('85c14014601373d607c9f8734e3fb765')

package() {
    cd "${srcdir}"
    install -Dm644 export-layers.scm "${pkgdir}/usr/share/gimp/2.0/scripts/export-layers.scm"
}
