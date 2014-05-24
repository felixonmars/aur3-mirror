# Maintainer: Josh VanderLinden <arch@cloudlery.com>
_base=crane
pkgname=${_base}-git
pkgver=r118.89f3407
pkgdesc="Lift Docker containers with ease"
arch=("i686" "x86_64")
url="https://github.com/michaelsauter/crane"
pkgrel=1
license=('MIT')
makedepends=('go' 'git')
provides=('crane')
source=("${_base}::git+https://github.com/michaelsauter/crane.git")
md5sums=('SKIP')

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

    install -Dm755 crane ${pkgdir}/usr/bin/crane
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
