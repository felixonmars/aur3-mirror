pkgname=git-htmldocs
pkgver=1.7.7
pkgrel=1
pkgdesc="Git HTML and plain text documentation pages"
arch=(any)
url="http://git-scm.com"
license=(GPL)  # For some Java script; don't know about most of it though
makedepends=(tar)
_file="$pkgname-$pkgver.tar.gz"
source=("http://git-core.googlecode.com/files/$_file")
md5sums=(11fdeb260d8160396ecdcb18daada00f)
sha256sums=(bcb11eda56ac74687cc6852f6ee104ab5dcf13039546616c608783cebc7f4a40)

package() {
    local DIR="$pkgdir/usr/share/doc/git-doc"
    install -d "$DIR"
    tar xzf "$srcdir/$_file" -C "$DIR"
}
