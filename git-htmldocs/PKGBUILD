pkgname=git-htmldocs
pkgver=1.8.0.2
pkgrel=1
pkgdesc="Git HTML and plain text documentation pages"
arch=(any)
url="http://git-scm.com"
license=(GPL)  # For some Java script; don't know about most of it though
makedepends=(tar)
_file="$pkgname-$pkgver.tar.gz"
source=("http://git-core.googlecode.com/files/$_file")
noextract=("$_file")
md5sums=(74bfbd1173943442d26d1831a3e52db0)

package() {
    local DIR="$pkgdir/usr/share/doc/git-doc"
    install -d "$DIR"
    tar xzf "$srcdir/$_file" -C "$DIR" --no-same-owner
}
