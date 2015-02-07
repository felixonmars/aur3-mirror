# Maintainer: Mike Cooper <mythmon@gmail.com>
pkgname=libnss-etcd-git
pkgver=r10.3e1a166
pkgrel=2
pkgdesc="A libnss resolver based off etcdctl"
arch=('i686' 'x86_64')
url="https://github.com/tingar/libnss_etcd"
license=('Apache')
depends=(
    'glibc'
    'etcd'
)
makedepends=('git')
conflicts=('nsslib-etcd')
provides=('nsslib-etcd')
source=(
    "${pkgname}::git+${url}.git"
)
sha256sums=(
    'SKIP'
)

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"
    install -D libnss_etcd.so.2 -t $pkgdir/usr/lib/
}
