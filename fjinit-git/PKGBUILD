pkgname=fjinit-git
pkgver=r81.175ef4e
pkgrel=1

pkgdesc='A process reaper for firejail'
url='https://github.com/ScoreUnder/fjinit'
arch=('i686' 'x86_64')
license=('GPL')

depends=()
makedepends=('git')

provides=('fjinit')
conflicts=('fjinit')

source=('git://github.com/ScoreUnder/fjinit')

md5sums=('SKIP')

pkgver() {
    cd fjinit
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
}

build() {
    cd fjinit
    make -e
}

package() {
    cd fjinit
    make -e DESTDIR="$pkgdir" PREFIX="/usr" install
}
