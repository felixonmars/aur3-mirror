# Contributor: Borislav Gerassimov (slimmer) <borislavba (at) gmail.com>
pkgname=qutim-plugin-accountname
pkgver=0.1.1
pkgrel=1
pkgdesc="Changes account names in Qutim"
arch=('i686' 'x86_64')
url="http://qutim.org"
license=('GPL')
makedepends=('make')
depends=('qutim')
source=("http://www.qutim.org/uploads/src/plugins/accountname-$pkgver.tar.bz2")
md5sums=('031c7bc9ec95576fa1494e09e73f27bb')

build() {
msg "Building and installing..."
   cd $srcdir/accountname-$pkgver
   qmake || return 1
   make || return 1
   install -Dm 644 libaccountname.so \
                   $pkgdir/usr/lib/qutim/libaccountname.so || return 1 
}
