pkgname=jquery-cookie
pkgver=1.4.1
pkgrel=1
pkgdesc="A simple, lightweight jQuery plugin for reading, writing and deleting cookies."
arch=(any)
url="https://github.com/carhartl/jquery-cookie"
license=('MIT')
depends=('jquery')

source=("https://raw.githubusercontent.com/carhartl/jquery-cookie/master/src/jquery.cookie.js")
md5sums=('34259e1b3697ec38ec1ad00f29c64305')

package() {
    mkdir -p $pkgdir/usr/share/jquery
    install -m644 $srcdir/jquery.cookie.js $pkgdir/usr/share/jquery/
}

