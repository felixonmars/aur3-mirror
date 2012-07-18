# contributor: tantalum <tantalum at online dot de>
_pkgname=aeroolib
pkgname=$_pkgname-vcs
pkgver=1.0.0
pkgrel=1
pkgdesc="report creation library for the python programming language. current development version from bazaar"
arch=(any)
license=(gpl3)
depends=(bzr python2 python-genshi python-lxml libreoffice-extension-scripting-python)
conflicts=(aeroolib)
url=https://launchpad.net/$_pkgname

build() {
  if [ ! -d "$_pkgname" ]; then
    msg "Connecting to Bazaar server...."
    bzr branch $url
    msg "Bazaar checkout done or server timeout"
    msg "Starting build..."
  fi
}

package() {
  cd $_pkgname/$_pkgname
  python2 setup.py install --root=${pkgdir}
}