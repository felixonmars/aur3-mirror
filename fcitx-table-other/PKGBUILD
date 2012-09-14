pkgname=fcitx-table-other
pkgver=0.2.1
pkgrel=1
pkgdesc="fcitx-table-other provides some other tables for Fcitx, fork from ibus-table-others, scim-tables."
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx/"
license=('GPLv2')
provides=('fcitx-table-other')
depends=('fcitx>=4.2.0')
makedepends=('cmake' 'intltool')
source=(http://fcitx.googlecode.com/files/$pkgname-$pkgver.tar.xz)

build()
{
    cd "$srcdir"
    rm -rf "$pkgname-$pkgver-build"
    cp -r "$pkgname-$pkgver" "$srcdir/$pkgname-$pkgver-build"
    cd "$pkgname-$pkgver-build"

    cmake . -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_BUILD_TYPE=Release
    make || return 1
}

package()
{
    cd "$srcdir/$pkgname-$pkgver-build"
    make DESTDIR=$pkgdir install
}
md5sums=('f68accc4cb4e45da81a38517be236c14')
