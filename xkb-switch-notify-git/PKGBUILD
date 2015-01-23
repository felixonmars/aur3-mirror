# Maintainer: Robert Orzanna <orschiro@gmail.com>

pkgname=xkb-switch-notify-git
_pkgname=xkbSwitchNotify
pkgver=r18.bee45a6
pkgrel=1
pkgdesc="Switches between existing keyboard layouts and displays a libnotify (OSD) notification"
arch=('any')
url="https://github.com/orschiro/scriptlets/tree/master/XkbSwitchNotify"
license=('GPL2')
depends=('xkb-switch' 'libnotify')
makedepends=('git')
source=("$pkgname"::'git://github.com/orschiro/scriptlets.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname/XkbSwitchNotify"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -d -m755 "$pkgdir/usr/bin"
    install -m755 "$srcdir/$pkgname/XkbSwitchNotify/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
}
