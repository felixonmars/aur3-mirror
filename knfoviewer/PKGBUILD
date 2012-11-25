# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Panagiotis Papadopoulos

pkgname=knfoviewer
pkgver=0.3.3
pkgrel=4
pkgdesc="NFO File Viewer for KDE – KDE3 Version"
arch=(i686 x86_64)
url=http://$pkgname.googlecode.com
license=(GPL)
depends=(kdelibs3 qt)
install=$pkgname.install
source=($url/files/$pkgname-$pkgver.tar.gz)
sha256sums=('9965cf7ac591a2777ca22ff0aaddcab826db125603dc784b5690549f3fa2077d')
sha512sums=('fc7b436ba70c8aefb7233f72f7b94a18c5520857de6f88a6ea612a8b3d855c2e18510c02296fc400659c6286ec1f80e17940b780dbdd3499313dcf770dc7aed8')

build() {
    cd "$srcdir"
    rm -rf $pkgname-build/
    install -d $pkgname-build/
    cd $pkgname-build/
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE ../$pkgname
    make
}

package() {
    cd "$srcdir"/$pkgname-build/
    make DESTDIR="$pkgdir" install
}
