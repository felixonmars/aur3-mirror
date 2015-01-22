# Maintainer: Robert Orzanna <orschiro@gmail.com>

pkgname=scrotclip-git
_pkgname=scrotclip
pkgver=r16.2a7512d
pkgrel=1
pkgdesc="Simple bash wrapper for maim screenshot taking tool with OSD notification support"
arch=('any')
url="https://github.com/orschiro/scriptlets/tree/master/Scrotclip"
license=('GPL2')
depends=('libnotify' 'copyq' 'maim' 'slop')
makedepends=('git')
source=("$pkgname"::'git://github.com/orschiro/scriptlets.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname/Scrotclip"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -d -m755 "$pkgdir/usr/bin"
    install -m755 "$srcdir/$pkgname/Scrotclip/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
}
