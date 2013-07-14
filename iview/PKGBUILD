pkgname=iview  # TODO: python-iview
_rev=def7f72
pkgver="166+g$_rev"  # Commit count: git rev-list --count "$_rev"
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
md5sums=(8b12266959d0a989bbe4994e4077a2f7)

package() {
    cd "$srcdir/vadmium-python-iview-$_rev"
    python3 setup.py install --root="$pkgdir" --optimize=1
}
