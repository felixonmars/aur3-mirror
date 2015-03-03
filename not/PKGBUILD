# Maintainer: danb <danielbusch1992@googlemail.com>

pkgname=not
pkgver=20150302
pkgrel=1
pkgdesc="Simple system to create volume or brightness notifications for your tiling window manager or whatsoever"
arch=(x86_64 i686)
url='http://github.com/misterdanb/not'
license=(GPLv3)
depends=(python3 python-dbus python-yaml python-gobject python-cairo)
makedepends=(git)
options=('!strip' '!emptydirs')
source=('not::git://github.com/misterdanb/not.git')
md5sums=('SKIP')

package() {
  install -Dm755 "$srcdir/$pkgname/not-a-daemon" "$pkgdir/usr/bin/not-a-daemon"
  install -Dm755 "$srcdir/$pkgname/not-a-client" "$pkgdir/usr/bin/not-a-client"
  install -Dm344 "$srcdir/$pkgname/config.yaml" "$pkgdir/usr/share/not/config.yaml"
}
