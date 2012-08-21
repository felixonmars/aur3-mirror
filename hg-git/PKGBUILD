_proj=hg-git
pkgname="$_proj"
pkgver=0.3.3
pkgrel=1
pkgdesc="Mercurial plugin to convert to and from a Git repository"
arch=(any)
url="http://$_proj.github.com"
license=(GPL2)
depends=(python-dulwich)

_rls="$_proj-$pkgver"
source+=(
"https://pypi.python.org/packages/source/${_proj:0:1}/$_proj/$_rls.tar.gz")
md5sums+=(bfaeda9cba0824d814db04d01b482d63)

package() {
    cd "$srcdir/$_rls"
    python2 setup.py install --root="$pkgdir" --optimize=1
}
