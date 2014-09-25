pkgname=git-htmldocs
pkgver=2.1.0
pkgrel=1
pkgdesc="Git HTML and plain text documentation pages"
arch=(any)
url="http://git-scm.com"
license=(GPL)  # For some Java script; don't know about most of it though
makedepends=(tar)
_file="$pkgname-$pkgver.tar.xz"
source=("https://www.kernel.org/pub/software/scm/git/$_file")
noextract=("$_file")
md5sums=(5ceb3bf2fe3bc2ceb7e58a3ea1af7bea)

package() {
    local DIR="$pkgdir/usr/share/doc/git-doc"
    install -d "$DIR"
    tar xf "$srcdir/$_file" -C "$DIR" --no-same-owner
    chmod -R +u "$DIR"
}
