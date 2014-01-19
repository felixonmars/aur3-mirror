pkgbase=python-iview
pkgname=iview  # TODO: python-iview
_rev=d0bca22
pkgver="252+g$_rev"  # Commit count: git rev-list --count "$_rev"
pkgrel=1
pkgdesc="Alternative frontend for ABC TV's Iview service"
url="https://jeremy.visser.name/2009/08/python-iview"
arch=(any)
license=(GPL3)
makedepends=(python3)
depends=(python3 rtmpdump)
optdepends=(
    "python3-socksipy: Proxy support"
    "python-gobject: GTK frontend"
    "gtk3: GTK frontend"
)
provides=(python-iview)

source=("https://github.com/vadmium/python-iview/tarball/$_rev")
md5sums=(b9c70aa5a6ff7b8bba4082990c9e551d)

package() {
    cd "$srcdir/vadmium-python-iview-$_rev"
    python3 setup.py install --root="$pkgdir" --optimize=1
}
