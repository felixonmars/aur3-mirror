# Maintainer: Vladimir Khramtsov <harestomper@gmail.com>
pkgname=itmages-service-bzr
pkgver=0.33
pkgrel=1
pkgdesc="Uploading daemon for ITmages."
arch=('any')
url="https://launchpad.net/itmages"
license=('LGPL')
groups=('network')
depends=('python2' 'python-pycurl' 'dbus-python' 'python-lxml')
makedepends=('bzr')
md5sums=() #generate with 'makepkg -g'
_pkgname=itmages-service

build() {
  bzr branch lp:itmages/${_pkgname}
  cd "$srcdir/$_pkgname"
  python2 ./setup.py install --root="${pkgdir}"
}