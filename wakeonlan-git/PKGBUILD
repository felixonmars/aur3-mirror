pkgname=wakeonlan-git
pkgver=r2.6479d25
pkgrel=1

pkgdesc='C tool to send magical wake on lan.'
url='https://github.com/gulafaran/wakeonlan'
arch=('i686' 'x86_64')
license=('GPLv2')

depends=('glibc')
makedepends=('git' 'make' 'clang')

provides=('wakeonlan')
conflicts=('wakeonlan')

source=('git://github.com/gulafaran/wakeonlan.git')

md5sums=('SKIP')


pkgver() {
    cd "wakeonlan" 
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
}

build() {
    cd "wakeonlan"
    make
}

package() {
    cd "wakeonlan" 
    install -Dm775 "wakeonlan" "$pkgdir/usr/bin/wakeonlan"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/wakeonlan/LICENSE"
}
