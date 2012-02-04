# Contributor: Borislav Gerassimov (slimmer) <borislavba (at) gmail.com>
pkgname=qutim-plugin-protocolicon
pkgver=0.1.1
pkgrel=1
pkgdesc="Adds protocol icons in the contact list of Qutim"
arch=('i686' 'x86_64')
url="http://qutim.org"
license=('GPL')
makedepends=('make')
depends=('qutim')
source=("http://www.qutim.org/uploads/src/plugins/protocolicon-$pkgver.tar.bz2")
md5sums=('747348b765a779e6cf9bc259213b2759')

build() {
 msg "Building and installing..."
   cd $srcdir/protocolicon-$pkgver
   qmake || return 1
   make || return 1
   install -Dm 644 $srcdir/libprotocolicon.so \
                   $pkgdir/usr/lib/qutim/libprotocolicon.so || return 1 
}
