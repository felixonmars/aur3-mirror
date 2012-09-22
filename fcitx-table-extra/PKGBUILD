# Contributor: Leewings Ng <osideal@gmail.com>

pkgname=fcitx-table-extra
pkgver=0.3.3
pkgrel=1
pkgdesc="fcitx-table-extra provides extra table for Fcitx, including Boshiamy, Zhengma, and Cangjie3, Cangjie5."
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx/"
license=('GPL')
provides=('fcitx-table-extra')
depends=('fcitx>=4.2.0')
makedepends=('cmake' 'intltool')
source=(http://fcitx.googlecode.com/files/$pkgname-$pkgver.tar.xz)
sha1sums=('d6c4449a28f2748684219a824e931b4506d125fc')

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
