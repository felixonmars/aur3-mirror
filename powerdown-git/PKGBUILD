# Maintainer: tailinchu <use_my_id at gmail dot com>

pkgname=powerdown-git
pkgver=143.98bf2dc
pkgrel=1
pkgdesc="simple linux powersaving script (git version)"
arch=('any')
url="http://github.com/taylorchu/powerdown"
license=('GPL2')
depends=('bash' 'iw' 'ethtool' 'hdparm' 'bc' 'x86_energy_perf_policy')
makedepends=('git')
conflicts=('pm-utils')
provides=('pm-utils')
source=("git://github.com/taylorchu/powerdown.git")
md5sums=('SKIP')

_gitroot="powerdown"

pkgver () {
    cd "$srcdir/$_gitroot"
    echo "$(git rev-list --count HEAD).$(git describe --always)"
}

package() {
    cd "$srcdir/$_gitroot"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

