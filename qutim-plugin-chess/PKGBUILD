# Contributor: Borislav Gerassimov (slimmer) <borislavba (at) gmail.com>
pkgname=qutim-plugin-chess
pkgver=0.3
pkgrel=1
pkgdesc="Play chess with your friends in Qutim."
arch=('i686' 'x86_64')
url="http://qutim.org"
license=('GPL')
makedepends=('gcc' 'make')
depends=('qutim')
source=("http://kostindima.googlepages.com/qutim-chess-plugin-$pkgver.tar.gz")
md5sums=('b138379118dcdcae05df492b475923b5')

build() {
msg "Building and installing..."
   cd $srcdir/qutim-chess-plugin
   qmake || return 1
   make || return 1
   install -Dm 644 libchessplugin.so \
                   $pkgdir/usr/lib/qutim/libchessplugin.so || return 1 
}
