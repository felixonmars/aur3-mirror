# Maintainer: Daniel Campbell <dlcampbell at gmx dot com>
pkgname=dupekill
pkgver=1.6
pkgrel=1
pkgdesc="A utility for deleting files with duplicate content."
arch=('any')
url="https://github.com/sporkbox/dupekill"
license=('custom')
groups=()
depends=('python>=3')
source=("https://github.com/sporkbox/dupekill/raw/d0e23ac047936713a2d18b930928cb03526e02f0/${pkgname}" 'LICENSE')
md5sums=('90de8f1c66c1b9f2eb8b4bd7c64dc59a'
         '66cb1d8398af4394e6526af81c5beadb')

package() {
	mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m755 $pkgname "${pkgdir}/usr/bin"
	install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
