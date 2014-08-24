# Maintainer: Nicolas Hureau <archlinux@kalenz.fr>

pkgname=darm-git
pkgver=409.2d698bc
pkgrel=1
pkgdesc="An ARMv7 disassembling library written in C."
arch=("i686" "x86_64")
url="https://github.com/jbremer/darm"
license=("BSD")
depends=()
makedepends=("git" "python3")
optdepends=("python2: python2 bindings"
            "python3: python3 bindings")
provides=("darm")
conflicts=("darm")
source=(
  "darm::git://github.com/jbremer/darm.git"
  "darm.pc"
)
sha256sums=(
  "SKIP"
  "e3084a3323b9199809a8a8dff9ebce6232f222811fced653bbb6e635895e54dd"
)
_gitname="darm"

pkgver() {
  cd "$srcdir/$_gitname"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  make -j1
}

package() {
  mkdir -p "$pkgdir/usr/bin/"
  install -Dm755 "$srcdir/$_gitname/utils/elfdarm" "$pkgdir/usr/bin/"

  mkdir -p "$pkgdir/usr/lib/"
  install -Dm644 "$srcdir/$_gitname/libdarm.a" "$pkgdir/usr/lib/"
  install -Dm755 "$srcdir/$_gitname/libdarm.so" "$pkgdir/usr/lib/"

  mkdir -p "$pkgdir/usr/include/darm/"
  install -Dm644 "$srcdir/$_gitname/darm.h" "$pkgdir/usr/include/darm/"
  install -Dm644 "$srcdir/$_gitname/darm-tbl.h" "$pkgdir/usr/include/darm/"
  install -Dm644 "$srcdir/$_gitname/armv7-tbl.h" "$pkgdir/usr/include/darm/"

  mkdir -p "$pkgdir/usr/lib/python2.7/site-packages/"
  install -Dm644 "$srcdir/$_gitname/darm.py" "$pkgdir/usr/lib/python2.7/site-packages/"
  ln -s "/usr/lib/libdarm.so" "$pkgdir/usr/lib/python2.7/site-packages/"

  mkdir -p "$pkgdir/usr/lib/python3.4/site-packages/"
  install -Dm644 "$srcdir/$_gitname/darm.py" "$pkgdir/usr/lib/python3.4/site-packages/"
  ln -s "/usr/lib/libdarm.so" "$pkgdir/usr/lib/python3.4/site-packages/"

  mkdir -p "$pkgdir/usr/lib/pkgconfig/"
  install -Dm644 "$srcdir/darm.pc" "$pkgdir/usr/lib/pkgconfig/"
}

# vim:set ts=2 sw=2 et:
