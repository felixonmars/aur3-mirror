# Maintainer: Anthony Cornehl <accornehl[at]gmail[dot]com>
# https://github.com/twinshadow/abs

_realpkgname="swift"
pkgname="openstack-${_realpkgname}-git"
pkgdesc="OpenStack distributed object storage system"
pkgver=0.0.0
pkgrel=2
conflicts=("openstack-${_realpkgname}", "${_realpkgname}")
provides=("openstack-${_realpkgname}")
arch=("any")
license=("custom")
url="https://github.com/openstack/${_realpkgname}"
depends=(
    "python2"
    "python2-dnspython"
    "python2-eventlet"
    "python2-greenlet"
    "python2-netaddr"
    "python2-paste-deploy"
    "python2-requests"
    "python2-simplejson"
    "python2-swiftclient-git"
    "python2-xattr"
)
makedepends=(
    "python2-setuptools"
    "git"
)
source=("$pkgname"::"git+https://github.com/openstack/${_realpkgname}")
md5sums=("SKIP")

pkgver() {
  cd "$pkgname"
  local ver="$(git describe --long)"
  printf "%s" "${ver//-/.}"
}

build() {
  cd "$pkgname"
  python2 setup.py build
}

package() {
  cd "$pkgname"
  python2 setup.py install --root="$pkgdir" --optimize=1

  install -dm600 "$pkgdir/etc/${_realpkgname}"
  install -Dm600 etc/* "$pkgdir/etc/${_realpkgname}/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_realpkgname}/LICENSE"
}
