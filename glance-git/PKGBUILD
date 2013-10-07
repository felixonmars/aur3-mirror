# Maintainer: Anthony Cornehl <accornehl@gmail.com>

_realpkgname=glance
pkgname=${_realpkgname}-git
pkgdesc="OpenStack image registry and delivery service"
pkgver=0.0.0
pkgrel=1
conflicts=("${_realpkgname}")
provides=("${_realpkgname}")
arch=("any")
license=("custom")
url="https://github.com/openstack/${_realpkgname}"
depends=("python2"
    "python2-anyjson"
    "python2-boto"
    "python2-crypto"
    "python2-eventlet"
    "python2-greenlet"
    "python2-httplib2"
    "python2-iso8601"
    "python2-kombu"
    "python2-lxml"
    "python2-migrate"
    "python2-oslo-config-git"
    "python2-passlib"
    "python2-paste"
    "python2-paste-deploy"
    "python2-pyopenssl"
    "python2-routes"
    "python2-sendfile"
    "python2-six"
    "python2-sqlalchemy"
    "python2-warlock"
    "python2-webob"
    "python2-wsgiref"
    "python2-xattr")
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

  install -dm600 "$pkgdir/etc/$pkgname"
  install -Dm600 etc/* "$pkgdir/etc/$pkgname/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
