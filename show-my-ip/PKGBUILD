# Maintainer: Malte Bublitz <me@malte-bublitz.de>

pkgname=show-my-ip
pkgver=0.0.1
pkgrel=1
pkgdesc="A simple tool to display your IP address, both local (LAN) and global (Internet)"
arch=(any)
url="https://github.com/malte70/show-my-ip"
license=("BSD")
depends=("python2" "python2-netifaces")
makedepends=("python2-distribute")
source=("$pkgname-$pkgver.tar.gz::https://github.com/malte70/$pkgname/archive/v$pkgver.tar.gz")

package() {
	cd "${srcdir}/$pkgname-${pkgver}"
	python2 setup.py install --root="${pkgdir}/" --optimize=1
}
sha1sums=('c82c42b855f6816c9931e00bb733813bc1514b9c')
