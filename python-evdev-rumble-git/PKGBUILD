# Maintainer: Lauri Niskanen <ape@ape3000.com>
# Based on PKGBUILD by Bernd Helm and Mike Shade <mshade@mshade.org>

_pkgname=evdev
pkgname=python-$_pkgname-rumble-git
pkgver=1
pkgrel=1
pkgdesc="Python bindings for the linux input handling subsystem with rumble support"
arch=(any)
url="http://packages.python.org/evdev/"
license=(New BSD)
depends=(python linux-api-headers)
makedepends=(git python-distribute)
provides=(python-$_pkgname=$pkgver)
conflicts=(python-$_pkgname)
source=("${pkgname%}::git+https://github.com/Ape/python-evdev.git")
sha256sums=('SKIP')

package() {
    cd "$srcdir"/$pkgname
    python setup.py install --prefix=/usr --root=$pkgdir --optimize=1
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
