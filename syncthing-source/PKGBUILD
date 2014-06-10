# Maintainer : prurigro
# Contributor: sauyon
# Contributor: Martin Wimpress <code@flexion.org>

_pkgname=syncthing
pkgname=${_pkgname}-source
pkgver=0.8.14
pkgrel=1
pkgdesc="Open source continuous replication / cluster synchronization thing and discovey server (build from source)"
url="http://syncthing.net"
license=('MIT')
install=${pkgname}.install
depends=('glibc')
makedepends=('git' 'go' 'godep' 'mercurial')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
provides=('syncthing')
replaces=('syncthing')
conflicts=('syncthing')
sha512sums=('SKIP'
            '424806246eb45717c768f1e28efca8f9b66b0f15eba0fa0ff8ebd9193127aa8f45cc39c88cae599c102069e7c9b3bceed68a087c6451016c2cdac367b9e6c113'
            '38c01db52c5802ffc0d4ec33ce19d44070cce8d55a8342fea06600aa0112f8b51a0d200f0b90494d0c5f86813321ba69b9d0c25c1fd4038154934345d32a0ede'
            'dafadb0c87b1f5b20c337cc0171f254586cc195304ad9b471392247537be06a98cac29575649109a176aa66ea8cee2809a051557352b86a117151e868d8392b3')
source=("git://github.com/calmh/syncthing.git" "${_pkgname}@.service" "${_pkgname}-discosrv.service" "${_pkgname}.1")

_discosrv_ver=b783169

prepare() {
    export GOPATH="$srcdir"

    # Remove Old Build Environment (if it exists)
    [[ -d src ]] && rm -rf src

    # Setup Build Environment
    install -d src/github.com/calmh
    mv ${_pkgname} src/github.com/calmh/
    cd src/github.com/calmh/${_pkgname}
    echo "Checking out v${pkgver}"
    git checkout v${pkgver} > /dev/null 2>&1
}

build() {
    export GOPATH="$srcdir"

    # Build Syncthing
    cd src/github.com/calmh/${_pkgname}
    echo "Building Syncthing"
    ./build.sh

    # Build Discovery Server
    echo "Building Syncthing discovery server dependencies"
    go get github.com/vitrun/qart/qr
    go get bitbucket.org/kardianos/osext
    go get code.google.com/p/go.crypto/bcrypt
    go get code.google.com/p/go.text/unicode/norm
    go get github.com/codegangsta/martini
    go get github.com/juju/ratelimit
    go get github.com/golang/groupcache/lru
    ./build.sh deps
    cd discover/cmd/discosrv
    echo "Building Syncthing discovery server"
    go build main.go
}

check() {
    cd src/github.com/calmh/${_pkgname}
    GOPATH="$srcdir" ./build.sh test
}

package() {
    install -Dm644 ${_pkgname}.1 "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
    install -Dm644 ${_pkgname}@.service "${pkgdir}/usr/lib/systemd/system/${_pkgname}@.service"
    install -Dm644 ${_pkgname}-discosrv.service "${pkgdir}/usr/lib/systemd/system/${_pkgname}-discosrv.service"

    cd src/github.com/calmh/${_pkgname}
    install -Dm755 $_pkgname "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm755 discover/cmd/discosrv/main "${pkgdir}/usr/bin/${_pkgname}-discosrv"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
