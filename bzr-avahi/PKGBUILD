# Contributor: Javier «Phrodo_00» Aravena <phrodo.00@gmail.com>
pkgname=bzr-avahi
pkgver=0.2.0
pkgrel=1
pkgdesc="Bazaar plugin that can serve a directory of branches and advertise them to the local network via. mDNS"
arch=('i686')
url="https://launchpad.net/bzr-avahi"
license=('GPL')
depends=('bzr' 'avahi' 'dbus-python')
source=("http://launchpad.net/bzr-avahi/trunk/0.2.0/+download/$pkgname-$pkgver.tar.gz")
md5sums=('a27b34aa4f036d97241d9220937d0dea')

build() {
  cd "$startdir/src/$pkgname-$pkgver"
  python setup.py install --prefix'=/usr' --root="${startdir}/pkg" || return 1
}

# vim:set ts=2 sw=2 et:
