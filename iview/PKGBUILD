pkgbase=python-iview
pkgname=iview  # TODO: python-iview
_rev=c1cc965
pkgver="180+g$_rev"  # Commit count: git rev-list --count "$_rev"
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
md5sums=(adbdf58aa3c0ca89c8512722d5bc7c5c)

package() {
    cd "$srcdir/vadmium-python-iview-$_rev"
    python3 setup.py install --root="$pkgdir" --optimize=1
}
