pkgname=iview  # TODO: python-iview
_rev=f3bd571
pkgver="127+g$_rev"  # Commit count: git rev-list --count "$_rev"
pkgrel=1
pkgdesc="Alternative frontend for ABC TV's Iview service"
url="https://jeremy.visser.name/2009/08/python-iview"
arch=(any)
license=(GPL3)
makedepends=(python2)
depends=(python2 rtmpdump)
optdepends=(
    "socksipy: Proxy support"
    "pygtk: GTK frontend"
)
provides=(python-iview)

source=("https://github.com/vadmium/python-iview/tarball/$_rev")
md5sums=(3f8ed0601426abcfe9a3044978bd8fc3)

package() {
    cd "$srcdir/vadmium-python-iview-$_rev"
    python2 setup.py install --root="$pkgdir" --optimize=1
}
