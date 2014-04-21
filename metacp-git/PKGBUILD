pkgname=metacp-git
pkgver=r15.477e995
pkgrel=1

pkgdesc='Copies file metadata without copying file contents'
url='https://github.com/falconindy/metacp'
arch=('i686' 'x86_64')
license=('MIT')

depends=('libcap' 'acl')

source=('git://github.com/falconindy/metacp')

md5sums=('SKIP')

pkgver() {
    cd metacp
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
}

build() {
    cd metacp
    make
}

package() {
    cd metacp
    install -Dm755 metacp "$pkgdir"/usr/bin/metacp
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
