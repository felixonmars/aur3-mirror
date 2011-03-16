# Contributor: said <atvordhosbn at gmail dot com> 
# 1st adopter: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=klikit
pkgver=1.0
pkgrel=2
pkgdesc="Classical brain-twister 15-puzzle."
arch=('i686' 'x86_64')
url="http://qt-apps.org/content/show.php/Klikit?content=102867"
license=('GPL2')
depends=('qt>=4.2')
source=("http://simpleqtgames.googlecode.com/files/Klikit-${pkgver}.tar.gz")
md5sums=('4ca69f786c0938c81b03e4fc732d936a')

build() {
    cd  $srcdir/Klikit-$pkgver
    qmake || return 1
    make || return 1
    install -Dm755 Klikit $pkgdir/usr/bin/$pkgname || return 1 
}
