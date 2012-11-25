# Contributor: Leigh <leighallison at earthlink.net>

pkgname=scim-bridge
pkgver=0.4.16
pkgrel=2
pkgdesc="scim-bridge IM-client for SCIM"
arch=(i686 x86_64)
url="http://www.scim-im.org/projects/scim_bridge"
license=(GPL LGPL)
depends=(scim)
makedepends=(doxygen qt)
install=$pkgname.install
source=(http://downloads.sourceforge.net/sourceforge/scim/$pkgname-$pkgver.tar.gz
    configure-fix.patch
    agent.patch)
sha256sums=('50d9da4a2842ab31cd3b27b1baacb14c458614bdb35855c6ecd09ab855ac702c'
    'f6cf2efb9ce62d78c229ed2e14847a190cfb9746118f514fffb1812390d7fe02'
    'f010f5202f1d6f7cf60db5165ebc3adcea15de91495f8376bb51568ba58ae5c2')
sha512sums=('8d40a931738f6130ab2fdc4e8dec70143874c53d5720a0403603b57c9f80d7c0a4802609e0446684fa5cba1758e78e5f333d01787527934ed7a19c9727fd66a6'
    '614245f28501c9c4da2dcd00b950fb98dbe6afe8ecafc42f0945e943e1716fab3c5d947e0336f65d9174ba38d8dbd29d0deaeb58cb129fb6c565014ca1d26a43'
    'bf030a008c92f7f9c58a2a207835291154d01272617083f12f2c13006546f49924296f02401f2a2a46b9435a37fa5281eec662975feb56d81d59b68b099d5f07')

build() {
    cd "$srcdir"/$pkgname-$pkgver/
    patch -Np1 -i ../configure-fix.patch
    patch -Np1 -i ../agent.patch
    sed -i 's:/plugins:/lib/qt/plugins:g' client-qt/qt4/Makefile.{in,am}
    ./configure \
        --prefix=/usr \
        --enable-agent \
        --enable-qt4-immodule \
        --disable-qt3-immodule \
        --enable-gtk2-immodule
    make
}

package() {
    cd "$srcdir"/$pkgname-$pkgver/
    make DESTDIR="$pkgdir" install
}
