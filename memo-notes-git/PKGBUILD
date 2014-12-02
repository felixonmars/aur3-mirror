# See AUR interface to contact current maintainer.

# Read http://thelinuxrain.com/articles/memo-note-taking-unix-style
# for some tips on how to use this.

pkgname=memo-notes-git
pkgver=1.4.r102
pkgrel=1
pkgdesc="memo: A CLI note taking application."
arch=('i686' 'x86_64')
url="http://www.ideabyte.net/memo/"
license=('custom')
makedepends=('git')
source=("$pkgname::git://github.com/nrosvall/memo.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "%s.r%s" \
    "$(git describe --abbrev=0 | sed 's/^v//')" \
    "$(git rev-list --count HEAD)"
    #"$(git log -1 --format="%cd" --date=short | sed 's/\-//g')" \
    #"$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  sed -i -e 's/CFLAGS=/CFLAGS+=/' \
    -e 's#\(PREFIX=\)/usr/local#&/usr#' \
    Makefile
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package () {
  cd "$srcdir/$pkgname"

  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/man/man1
  mkdir -p "$pkgdir"/usr/share/doc/"$pkgname"
  #mkdir -p "$pkgdir"/usr/share/licenses/"$pkgname"

  install -m755 "$srcdir/$pkgname"/memo "$pkgdir"/usr/bin
  install -m644 "$srcdir/$pkgname"/memo.1 "$pkgdir"/usr/share/man/man1
  install -m644 "$srcdir/$pkgname"/README "$pkgdir"/usr/share/doc/"$pkgname"
  install -m644 "$srcdir/$pkgname"/NEWS "$pkgdir"/usr/share/doc/"$pkgname"
}
