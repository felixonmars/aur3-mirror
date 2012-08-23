pkgname=iview
_proj="python-$pkgname"
_revno=75
_acc=akent
_rev=acf37f8
pkgver="$_revno+0.2"  # Version number from iview.config.version
pkgrel=1
pkgdesc="Alternative frontend for ABC TV's Iview service"
url="https://jeremy.visser.name/2009/08/$_proj"
arch=(any)
license=(GPL3)
makedepends=(python2 patch)
depends=(python2 python-beautifulsoup rtmpdump)
optdepends=(
    "socksipy: Proxy support"
    "pygtk: GTK frontend"
)
provides=("$_proj")
source=(setup.diff)
md5sums=(315f3636efe53b02972c79b65269b608)

source+=("https://github.com/$_acc/$_proj/tarball/$_rev")
md5sums+=(43fdd1d14de42b0067658152e0fd4233)

_tardir="$_acc-$_proj-$_rev"

build() {
    patch -d "$srcdir/$_tardir" -p0 < ../setup.diff
}

package() {
    cd "$srcdir/$_tardir"
    python2 setup.py install --root="$pkgdir" --optimize=1
}
