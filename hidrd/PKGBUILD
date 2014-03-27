# Maintainer: Peter Wu <peter at lekensteyn.nl>
pkgname=hidrd
pkgver=0.2.0
pkgrel=1
pkgdesc='HID report descriptor I/O library and conversion tool'
arch=('i686' 'x86_64')
url='https://github.com/DIGImend/hidrd'
license=('GPL2')
depends=('libxml2')
source=("https://github.com/DIGImend/hidrd/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('6969c10103cda116681700764c1be90f')
sha1sums=('63076ab385958c4666ac45424dabc4f15e4adb06')
sha256sums=('060c3f2ed20f6071440c8f8bfa7a063aa9529293f1a049ede76721ac3dcc7e95')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
