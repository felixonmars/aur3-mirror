# Contributor: Leewings Ng <osideal@gmail.com>
# Contributor: Hiroshi Yui <hiroshiyui@gmail.com>

pkgname=ibus-table-chinese
pkgver=1.4.6
pkgrel=1
pkgdesc="Some table-based input method of tables engines for IBus"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ibus/"
license=('GPL3')
provides=('ibus-table-chinese')
depends=('ibus' 'ibus-table>=1.4.99.20121112')
makedepends=('cmake')
source=(http://ibus.googlecode.com/files/$pkgname-$pkgver-Source.tar.gz)
sha1sums=('c0777087b81a29bc32c86838d214ce31ce3424f6')

build()
{
    cd $srcdir/$pkgname-$pkgver-Source
    cmake . -DCMAKE_INSTALL_PREFIX='/usr' -DLIBEXEC_DIR='/usr/libexec'
    make || return 1
    make DESTDIR="$pkgdir/" install
}

