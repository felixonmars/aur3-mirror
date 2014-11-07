# Maintainer: David McMackins <david@delwink.com>
pkgname=dogefetch-delwink
pkgver=1.1.1
pkgrel=1
epoch=
pkgdesc="Gets BTer exchange rates for Bitcoin, Litecoin, and Dogecoin (Delwink Edition)"
arch=(any)
url="http://delwink.com/software/dogefetch.html"
license=('MIT')
groups=()
depends=('python' 'python-requests')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://delwink.com/dl/dogefetch-$pkgver.tar.gz)
noextract=()
md5sums=('6a57d2bf8c7c67235fc424de2c27a927')

package() {
    make -C "dogefetch-del$pkgver" DESTDIR=$pkgdir PREFIX=/usr
}
