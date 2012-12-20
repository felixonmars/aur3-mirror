# Maintainer: Alexander Zubakov <developer@xinit.ru>
pkgname=php-blitz
pkgver=0.8.6
pkgrel=1
epoch=0
pkgdesc="Blitz templates, template engine extension for PHP. Fast and powerfull template engine for very big internet projects."
arch=('i686' 'x86_64')
url="http://alexeyrybak.com/blitz/blitz_en.html"
license=('custom')
depends=('php')
makedepends=('autoconf' 'gcc' 'make')
source=("http://alexeyrybak.com/blitz/all-releases/blitz-$pkgver.tar.gz")
md5sums=('9feb0c99c5097e122bbdb2ea4f379cbc')

build() {
    cd "$srcdir/blitz-$pkgver"
    phpize
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/blitz-$pkgver"
    make INSTALL_ROOT="$pkgdir" install

    mkdir -p "$pkgdir/usr/share/licenses/php-blitz"
    cp LICENSE "$pkgdir/usr/share/licenses/php-blitz/"

    mkdir -p "$pkgdir/etc/php/conf.d"
    echo "extension=blitz.so" > "$pkgdir/etc/php/conf.d/blitz.ini"
}
