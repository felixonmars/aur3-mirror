# Maintainer: Robert Orzanna <orschiro@gmail.com>

pkgname=maimclip-git
_pkgname=maimclip
pkgver=r22.c5792a8
pkgrel=1
pkgdesc="Simple bash wrapper for maim screenshot taking tool with OSD notification support"
arch=('any')
url="https://github.com/orschiro/scriptlets/tree/master/Maimclip"
license=('GPL2')
depends=('libnotify' 'copyq' 'maim' 'slop')
makedepends=('git')
source=("$pkgname"::'git://github.com/orschiro/scriptlets.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname/Maimclip"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -d -m755 "$pkgdir/usr/bin"
    install -m755 "$srcdir/$pkgname/Maimclip/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
}
