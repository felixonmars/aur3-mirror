# Maintainer: Josh VanderLinden <arch@cloudlery.com>
_base=skydock
pkgname=${_base}-git
pkgver=r86.6a6ad93
pkgdesc="Service discovery via DNS for docker"
arch=("i686" "x86_64")
url="https://github.com/crosbymichael/skydock"
pkgrel=1
license=('MIT')
depends=('skydns2')
makedepends=('go' 'git')
provides=('skydock')
source=("${_base}::git+https://github.com/crosbymichael/skydock.git")
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

    local plugin_dir=${pkgdir}/usr/share/${_base}/plugins
    mkdir -p ${plugin_dir}
    cp -a ./plugins/* ${plugin_dir}

    install -Dm755 skydock ${pkgdir}/usr/bin/skydock
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
