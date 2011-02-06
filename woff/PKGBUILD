# Maintainer: Alex Dioso <adioso->gmail*com>
pkgname=woff
pkgver=2009.10.04.12.32
pkgrel=1
pkgdesc="Programs to convert existing TrueType/OpenType fonts to WOFF format and vice versa."
arch=('i686' 'x86_64')
url="http://people.mozilla.com/~jkew/woff"
license=('MPL' 'GPL' 'LGPL')
depends=('zlib')
install=
#source=(http://people.mozilla.com/~jkew/woff/$pkgname-code-latest.zip)
source=($url/$pkgname-code-latest.zip)
md5sums=(1dcdbc9a7f48086185740c185d822279)

build() {
    cd $srcdir
    make || return 1
}

package() {
    cd $srcdir
    install -m 0755 -D sfnt2woff $pkgdir/usr/bin/sfnt2woff
    install -m 0755 -D woff2sfnt $pkgdir/usr/bin/woff2sfnt
    install -m 0755 -D woff-2009-10-03.html \
        $pkgdir/usr/share/doc/$pkgname/woff-2009-10-03.html
}
