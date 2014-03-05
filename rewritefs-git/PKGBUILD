# Contributor: Sloonz <sloonz+aur@gmail.com>

pkgname=rewritefs-git
pkgver=r10.69e47da
pkgrel=1
pkgdesc="A FUSE filesystem intended to be used like Apache mod_rewrite"
arch=(i686 x86_64)
url="http://github.com/sloonz/rewritefs"
license=(GPL)
depends=(fuse pcre)
makedepends=(make)
source=("rewritefs"::"git://github.com/sloonz/rewritefs.git")
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/rewritefs"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/rewritefs"
  make
}

package() {
  cd "$srcdir/rewritefs"
  make DESTDIR=$pkgdir PREFIX=/usr install &&
  install -d "$pkgdir/usr/share/doc/rewritefs" &&
  install config.example "$pkgdir/usr/share/doc/rewritefs" &&
  install config.simple "$pkgdir/usr/share/doc/rewritefs"
}
