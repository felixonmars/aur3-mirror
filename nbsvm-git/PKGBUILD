# Maintainer: moebiuseye <möëbïüs döt ëÿë ät gmäïl döt cöm>

pkgname="nbsvm-git"
pkgver=22.4ae98dd
pkgrel=1
arch=(any)
pkgdesc="No bullshit VMs for KVM"
url="https://github.com/ChoHag/nbsvm"
license=(GPLv3)
depends=("sudo")
makedepends=("make" "git")
provides=("nbsvm")
conflicts=("nbsvm")
source=("git://github.com/ChoHag/nbsvm.git")
md5sums=("SKIP")

_gitroot=nbsvm

pkgver () {
    cd "$srcdir/$_gitroot"
    printf '%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_gitroot"
    echo " DSTDIR = $pkgdir "
}

package() {
    cd "$srcdir/$_gitroot"
    mkdir -p "$pkgdir/usr/bin"
    install ./nbsvm "$pkgdir/usr/bin/"
    tree "$pkgdir"
}
