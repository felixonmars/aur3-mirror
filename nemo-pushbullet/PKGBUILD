# Maintainer: agnotek <agnostic[dot]sn[at]gmail[dot]com>

pkgname=nemo-pushbullet
pkgver=0.3.0
_anotherpkgver=14.04.0
_alienpkgrel=0
pkgrel=1
pkgdesc="An extension for Nemo to send files with pushbullet"
arch=('any')
license=('GPL3')
url="http://www.atareao.es"
options=()
install="nemo-pushbullet.install"
conflicts=()
depends=('pushbullet-commons' 'python-dbus' 'python-requests' 'python-gobject' 'nemo-python' 'python-cairo')
optdepends=()
source=("https://launchpad.net/~atareao/+archive/ubuntu/atareao/+files/${pkgname}_${pkgver}-${_alienpkgrel}extras${_anotherpkgver}_all.deb"
	"nemo-pushbullet.install")
md5sums=('cee8789811de13b88de83551b5ab5177' 
	 '0edcb46e2fd2a52b73a4903a16c2a003')

package() {
  cd "${srcdir}"

  ar x "${pkgname}_${pkgver}-${_alienpkgrel}extras${_anotherpkgver}_all.deb" > /dev/null
  tar -xJf data.tar.xz -C "${pkgdir}"
 
  install -d -m755 "${pkgdir}/usr/"

}

