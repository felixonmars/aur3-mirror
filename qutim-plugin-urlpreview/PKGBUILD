# Contributor: Borislav Gerassimov (slimmer) <borislavba (at) gmail.com>
pkgname=qutim-plugin-urlpreview
pkgver=0.0.2
pkgrel=1
pkgdesc="URL Preview for Qutim"
arch=('i686' 'x86_64')
url="http://qutim.org"
license=('GPL')
makedepends=('gcc' 'make')
depends=('qutim')
source=("http://boiler.co.ru/qutim/urlpreview-${pkgver}.tar.gz")
md5sums=('e9dc05b581ae5f671c3d934888f0c6c9')

build() {
msg "Building and installing..."
   cd $srcdir/urlpreview
   qmake || return 1
   make || return 1
   install -Dm 644 $srcdir/liburlpreview.so \
                   $pkgdir/usr/lib/qutim/liburlpreview.so || return 1 
}
