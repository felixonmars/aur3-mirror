pkgname=iview  # TODO: python-iview
_rev=99a2e78
pkgver="385+g$_rev"  # Commit count: git rev-list --count "$_rev"
pkgrel=1
pkgdesc="Alternative frontend for ABC TV's Iview service"
url="https://github.com/vadmium/python-iview"
arch=(any)
license=(GPL3)
makedepends=(python3)
depends=(python3)
optdepends=(
    "python-socks: Proxy support"
    "python-gobject: GTK frontend"
    "gtk3: GTK frontend"
    "rtmpdump: News 24 live stream"
)
provides=(python-iview)

source=("https://github.com/vadmium/python-iview/tarball/$_rev")
md5sums=(2e51f842ddda7e9bb841edd0113aeae8)

package() {
    cd "$srcdir/vadmium-python-iview-$_rev"
    python3 setup.py install --root="$pkgdir" --optimize=1
}
