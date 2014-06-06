# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Sauyon Lee <sauyonl@sauyon.com>
# Contributor: Kevin MacMartin <prurigro@gmail.com>

pkgname=syncthing
pkgver=0.8.13
pkgrel=1
pkgdesc="Open Source Continuous Replication / Cluster Synchronization Thing"
url="http://syncthing.net/"
license=('MIT')
arch=('i686' 'x86_64')
depends=('glibc')
makedepends=('git' 'go' 'godep' 'inetutils')
source=("${pkgname}::git+https://github.com/calmh/syncthing.git#tag=v${pkgver}"
        "syncthing@.service"
        "syncthing.1")
sha1sums=('SKIP'
          '204cad3823306c793a14a17a23220e26199160d4'
          'cabf3bf78457ce17057ae39fe3b0009a4aa446c4')
install=${pkgname}.install

prepare() {
    cd "${srcdir}"
    mkdir -p "src/github.com/calmh"
    mv "${pkgname}" "src/github.com/calmh/${pkgname}"
}

build() {
    export GOPATH="${srcdir}"
    cd "${srcdir}/src/github.com/calmh/${pkgname}"
    ./build.sh
}

check() {
    export GOPATH="${srcdir}"
    cd "${srcdir}/src/github.com/calmh/${pkgname}"
    ./build.sh test
}

package() {
    cd "${srcdir}/src/github.com/calmh/${pkgname}"
    install -D -m 755 syncthing "${pkgdir}/usr/bin/syncthing"
    install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -D -m 644 "${srcdir}/${pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}@.service"
    install -D -m 644 "${srcdir}/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}
