# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname=python2-swiftclient-havana
pkgver=1.9.0
pkgrel=1
pkgdesc="Client Library for OpenStack Object Storage API"
arch=('any')
url="https://github.com/openstack/python-swiftclient"
license=('Apache 2.0')
depends=('python2' 'python2-requests' 'python2-keystoneclient')
makedepends=('python2-distribute')
source=('https://github.com/openstack/python-swiftclient/archive/1.9.0.tar.gz')
md5sums=('df1cb42ba6c71de0b06b90fbe309c704')

build() {
  cd "python-swiftclient-$pkgver"
  echo -e "Name: python-swiftclient\nVersion: $pkgver" > PKG-INFO
  sed -e 's|bin/python|bin/python2|' -i bin/swift
}

package() {
  cd "python-swiftclient-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
