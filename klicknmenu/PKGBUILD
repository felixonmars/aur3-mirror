# Maintainer: seokbeom Kim(chaoxifer@gmail.com)
pkgname=klicknmenu
pkgver=0.1
pkgrel=1
pkgdesc="klicknmenu is x11-based lightweight menu application"
url="http://github.com/seokbeomKim/klicknmenu"
arch=('x86_64' 'i686')
license=('MIT')
depends=('libx11')
optdepends=()
makedepends=('git')
conflicts=()
replaces=()
backup=()
source=("$pkgname::git+git://github.com/seokbeomKim/klicknmenu/")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  sed -e 's@/usr/bin@${DESTDIR}@g' -i Makefile
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$srcdir/$pkgname/klicknmenu" "$pkgdir/usr/bin/klicknmenu" 
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:md5sums=('SKIP')
