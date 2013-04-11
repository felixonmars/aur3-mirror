# Maintainer: tailinchu <use_my_id at gmail dot com>

pkgname=dtray-git
pkgver=4.1f35ebf
pkgrel=1
pkgdesc="taylorchu's dtray repo (git version)"
arch=('i686' 'x86_64')
url="http://github.com/taylorchu/dtray"
license=('GPL2')
depends=('gtk2')
makedepends=('git')
conflicts=()
provides=()
source=("git://github.com/taylorchu/dtray.git")
md5sums=('SKIP')

_gitroot="dtray"

pkgver () {
    cd "$srcdir/$_gitroot"
    echo "$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
    cd "$srcdir/$_gitroot"
    make
}

package() {
    cd "$srcdir/$_gitroot"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

