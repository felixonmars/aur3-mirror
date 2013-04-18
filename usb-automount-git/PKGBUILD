# Maintainer: tailinchu <use_my_id at gmail dot com>

pkgname=usb-automount-git
pkgver=11.81886e8
pkgrel=1
pkgdesc="taylorchu's usb-automount repo (git version)"
arch=('any')
url="http://github.com/taylorchu/usb-automount"
license=('GPL2')
depends=('bash' 'systemd')
makedepends=('git')
conflicts=()
provides=()
source=("git://github.com/taylorchu/usb-automount.git")
md5sums=('SKIP')

_gitroot="usb-automount"

pkgver () {
    cd "$srcdir/$_gitroot"
    echo "$(git rev-list --count HEAD).$(git describe --always)"
}

package() {
    cd "$srcdir/$_gitroot"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

