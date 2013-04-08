# Maintainer: tailinchu <use_my_id at gmail dot com>

pkgname=device-sound-git
pkgver=4.205a15f
pkgrel=1
pkgdesc="taylorchu's device-sound repo (git version)"
arch=('any')
url="http://github.com/taylorchu/device-sound"
license=('GPL2')
depends=('bash' 'alsa-utils' 'systemd')
makedepends=('git')
conflicts=()
provides=()
source=("git://github.com/taylorchu/device-sound.git")
md5sums=('SKIP')

_gitroot="device-sound"

pkgver () {
    cd "$srcdir/$_gitroot"
    echo "$(git rev-list --count HEAD).$(git describe --always)"
}

package() {
    cd "$srcdir/$_gitroot"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

