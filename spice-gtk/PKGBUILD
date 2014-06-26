# Contributor: Patryk Kowalczyk < patryk at kowalczyk dot ws> 
# Maintainer: Ben Reedy <thebenj88 *AT* gmail *DOT* com>

pkgname=spice-gtk
pkgver=0.25
pkgrel=1
pkgdesc="SPICE client. with libcacard support"
arch=('x86_64' 'i686')
url="http://spice-space.org"
license=('GPL')
options=(!libtool)
conflicts=('spice-gtk3')
makedepends=('intltool' 'vala' 'python2-pyparsing')
depends=('spice' 'gtk2' 'usbredir' 'libusb' 'libpulse')
source=("http://spice-space.org/download/gtk/$pkgname-$pkgver.tar.bz2")
sha256sums=('0730c6a80ad9f5012f65927d443377019f300573f7ccc93db84eadec462ad087')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -i 's,/usr/bin/env python,/usr/bin/python2,' spice-common/spice_codegen.py

    ./configure --prefix=/usr \
    --with-python \
    --with-gtk=2.0 \
    --enable-vala
    make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
