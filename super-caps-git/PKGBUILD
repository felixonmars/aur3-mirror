# Maintainer: Evan Teitelman <teitelmanevan at gmail dot com>

pkgname=super-caps-git
_gitname=super-caps
pkgver=0.0.0
pkgrel=1
pkgdesc="Makes CapsLock act as Escape and Ctrl"
arch=(any)
url="https://github.com/cmatheson/super-caps"
license=('Unknown')
depends=(xorg-xmodmap xcape-git)
source=('git://github.com/cmatheson/super-caps.git')
md5sums=('SKIP')
makedepends=('git')
# Just in case
conflicts=('super-caps')
provides=('super-caps')

pkgver() {
  cd $_gitname
  git rev-list --max-count=1 --all | head -c7
}

prepare() {
  cd "$srcdir/$_gitname"
  sed -i "s|xmodmaprc|/usr/share/super-caps/xmodmaprc|" "super-caps.sh"
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm755 "super-caps.sh" "$pkgdir/usr/bin/super-caps"
  install -Dm644 "xmodmaprc" "$pkgdir/usr/share/super-caps/xmodmaprc"
}
