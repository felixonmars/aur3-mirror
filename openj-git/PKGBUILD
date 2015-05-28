pkgname=openj-git
pkgver=r63.18fd23b
pkgrel=4

pkgdesc='A high performance array based language as a synthesis of APL and FP.'
url='https://github.com/openj'
arch=('i686' 'x86_64')
license=('GPL3')

depends=('readline')
makedepends=('git')

provides=('openj')
conflicts=('openj')

source=('git://github.com/openj/core')

md5sums=('SKIP')

backup=('usr/share/j/profile.ijs')

pkgver() {
    cd core
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
}

build() {
    cd core
    cmake -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd core
    make DESTDIR="$pkgdir" install

    # Remove a conflict with some java thing.
    mv "$pkgdir"/usr/bin/jconsole "$pkgdir"/usr/bin/j
}
