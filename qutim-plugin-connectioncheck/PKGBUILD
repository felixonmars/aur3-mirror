# Contributor: Borislav Gerassimov (slimmer) <borislavba (at) gmail.com>
pkgname=qutim-plugin-connectioncheck
pkgver=0.0.7
pkgrel=1
pkgdesc="Changes account statuses in Qutim based on network connectivity."
arch=('i686' 'x86_64')
url="http://qutim.org"
license=('GPL')
makedepends=('gcc' 'make')
depends=('qutim')
source=("http://www.svtdpi.com.ua/sqee/qutim/plugins/connectioncheck-$pkgver.tar.bz2")
md5sums=('8c7562bde53b4c93943b6010e3a06d74')

build() {
msg "Building and installing..."
   cd $srcdir/connectioncheck
   qmake || return 1
   make || return 1
   install -Dm 644 libconnectioncheck.so \
                   $pkgdir/usr/lib/qutim/libconnectioncheck.so || return 1 
}
