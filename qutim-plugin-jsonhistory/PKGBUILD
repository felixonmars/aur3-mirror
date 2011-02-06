# Contributor: Borislav Gerassimov (slimmer) <borislavba (at) gmail.com>
pkgname=qutim-plugin-jsonhistory
pkgver=0.1.3
pkgrel=1
pkgdesc="Stores Qutim's history in JSON format"
arch=('i686' 'x86_64')
url="http://qutim.org"
license=('GPL')
makedepends=('make')
depends=('qutim')
source=("http://www.qutim.org/uploads/src/plugins/jsonhistory-$pkgver.tar.bz2")
md5sums=('345f881d5c7097f6822cee09f920f2f6')

build() {
msg "Building and installing..."
   cd $srcdir/jsonhistory-$pkgver
   qmake || return 1
   make || return 1
   install -Dm 644 libjsonhistory.so \
                   $pkgdir/usr/lib/qutim/libjsonhistory.so || return 1 
}
