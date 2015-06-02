pkgname=lua-messagepack-git
pkgver=0.3.3
pkgrel=1

pkgdesc='MessagePack implementation in lua.'
url='https://github.com/fperrad/lua-MessagePack'
arch=('any')
license=('custom:MIT')

depends=('lua')

provides=('lua-messagepack')
conflicts=('lua-messagepack')

source=('git://github.com/fperrad/lua-MessagePack.git')
sha256sums=('SKIP')

pkgver() {
    cd lua-MessagePack
    git describe | sed 's/-/.r/; s/-/./'
}

package() {
    cd lua-MessagePack
    make LUAVER=5.1 PREFIX=/usr DESTDIR="$pkgdir" install
    make LUAVER=5.2 PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 COPYRIGHT "$pkgdir"/usr/share/licenses/"$pkgname"/COPYRIGHT
}
