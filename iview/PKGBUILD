pkgbase=python-iview
pkgname=iview  # TODO: python-iview
_rev=14e304f
pkgver="238+g$_rev"  # Commit count: git rev-list --count "$_rev"
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
md5sums=(c96de2d76f7f3b406d5c19bc6c9eb3ac)

package() {
    cd "$srcdir/vadmium-python-iview-$_rev"
    python3 setup.py install --root="$pkgdir" --optimize=1
}
