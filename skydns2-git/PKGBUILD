# Maintainer: Josh VanderLinden <arch@cloudlery.com>
_base=skydns2
pkgname=${_base}-git
pkgver=r148.c31a962
pkgdesc="DNS service discovery for etcd"
arch=("i686" "x86_64")
url="https://github.com/skynetservices/skydns2"
pkgrel=1
license=('MIT')
depends=('etcd')
makedepends=('go' 'git' 'mercurial')
provides=('skydns2')
source=("${_base}::git+https://github.com/skynetservices/skydns2.git"
        "./LICENSE")
md5sums=('SKIP'
         '6ead29e9c54e1d2399821e330b0173b2')

pkgver() {
    cd "${srcdir}/${_base}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    export GOPATH=${srcdir}/go
    mkdir -p ${GOPATH}

    cd "${srcdir}/${_base}"
    go get -d -v .
    go build -v .
}

package() {
    cd "${srcdir}/${_base}"
    install -Dm755 skydns2 ${pkgdir}/usr/bin/skydns2
    install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
