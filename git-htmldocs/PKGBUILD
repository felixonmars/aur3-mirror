pkgname=git-htmldocs
pkgver=1.8.3.4
pkgrel=1
pkgdesc="Git HTML and plain text documentation pages"
arch=(any)
url="http://git-scm.com"
license=(GPL)  # For some Java script; don't know about most of it though
makedepends=(tar)
_file="$pkgname-$pkgver.tar.gz"
source=("http://git-core.googlecode.com/files/$_file")
noextract=("$_file")
md5sums=(be01cc4be1b946b053b69d12b422854a)

package() {
    local DIR="$pkgdir/usr/share/doc/git-doc"
    install -d "$DIR"
    tar xzf "$srcdir/$_file" -C "$DIR" --no-same-owner
}
