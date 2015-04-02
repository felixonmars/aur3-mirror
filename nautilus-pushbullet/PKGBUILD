# Maintainer: agnotek <agnostic[dot]sn[at]gmail[dot]com>

pkgname=nautilus-pushbullet
pkgver=0.3.0
_anotherpkgver=14.04.0
_alienpkgrel=0
pkgrel=1
pkgdesc="An extension for Nautilus to send files with pushbullet"
arch=('any')
license=('GPL3')
url="http://www.atareao.es"
options=()
install="nautilus-pushbullet.install"
conflicts=()
depends=('pushbullet-commons' 'python-dbus' 'python-requests' 'python-gobject' 'python2-nautilus' 'python-cairo')
optdepends=()
source=("https://launchpad.net/~atareao/+archive/ubuntu/atareao/+files/${pkgname}_${pkgver}-${_alienpkgrel}extras${_anotherpkgver}_all.deb"
	"nautilus-pushbullet.install")

md5sums=('e7d4d28137a06ef5cfb1e082abcf792e'
	 '0edcb46e2fd2a52b73a4903a16c2a003')

package() {
  cd "${srcdir}"

  ar x "${pkgname}_${pkgver}-${_alienpkgrel}extras${_anotherpkgver}_all.deb" > /dev/null
  tar -xJf data.tar.xz -C "${pkgdir}"
 
  install -d -m755 "${pkgdir}/usr/"

}

