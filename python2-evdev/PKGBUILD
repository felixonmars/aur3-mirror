# Maintainer: Mike Shade <mshade@mshade.org>

_pkgname=python-evdev
pkgname=python2-evdev
pkgver=0.4.3
pkgrel=1
pkgdesc="Python2 bindings for the linux input handling subsystem"
arch=(any)
url="http://packages.python.org/evdev/"
license=(New BSD)
depends=(python2 linux-api-headers)
makedepends=(python2-distribute)
provides=(python2-$_pkgname=$pkgver)
conflicts=(python2-$_pkgname)
source=(https://github.com/gvalkov/python-evdev/archive/v0.4.3.tar.gz)
sha256sums=('011db63c94e668997ce0609e4a3cb04b92aca21304657151e6567e938de5efc6')

package() {
    cd "$srcdir"/$_pkgname-$pkgver/
    python2 setup.py install --prefix=/usr --root=$pkgdir
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
