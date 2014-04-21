# Maintainer: Ikhwan Setiawan <kuro.kid@gmail.com>

_gitname=connme
pkgname="${_gitname}-git"
pkgver=0.5
pkgrel=1
pkgdesc="Client for Hostapd"
arch=('any')
url="https://github.com/kurokid/${_gitname}"
license=('GPL')
#groups=()
depends=('dnsmasq' 'hostapd' 'iptables' 'iw' 'python2-pyqt4')
makedepends=('git' 'python2-setuptools')
optdepends=('haveged')
source=("${_gitname}::git://github.com/kurokid/connme.git")
md5sums=('SKIP')

package() {
  cd "${_gitname}"

  python2 setup.py install --root="$pkgdir/" --optimize=1
}