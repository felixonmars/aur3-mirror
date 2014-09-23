# Maintainer: agnotek <agnostic.sn [at] gmail [dot] com>

pkgname=uu-downloader
pkgver=1.1
pkgrel=1
pkgdesc="Downloader for uupgrades - only gets the program"
arch=('any')
url="http://manjaro.org"
license=('GPL3')
makedepends=('zip')
depends=('yad' 'gksu')
options=('!strip')
md5sums=('SKIP'
	 'SKIP')

source=("https://dl.dropboxusercontent.com/u/9839330/uupgrades/uudownloader-1.1.tar.gz"
	"uudowner.desktop")

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin"

  # Program
  install -dm755 ${srcdir}/uu-downloader "${pkgdir}/usr/share/${pkgname}/"

  # Link to program
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/usr/share/${pkgname}/uu-downloader" "${pkgdir}/usr/bin/uu-downloader"

  # Desktop file
  install -m644 "${srcdir}/uudowner.desktop" "${pkgdir}/usr/share/applications/uudowner.desktop"
}

