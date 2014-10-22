# Maintainer: Tom Richards <tom@tomrichards.net>
# https://github.com/t-richards/aur-rest-client

pkgname=rest-client
_pkgname=restclient
pkgver=3.4.2
pkgrel=1
pkgdesc="Java application to test HTTP/RESTful webservices."
arch=('any')
url="https://github.com/wiztools/rest-client"
license=('Apache')
makedepends=('maven')
source=("https://github.com/wiztools/rest-client/archive/${_pkgname}-${pkgver}.tar.gz"
        "rest-client.sh"
        "rest-client.desktop")
sha256sums=('f7bcd8b4619ca9d1e057b230246ba7002a73f929a4728a25663588cb3ceba76b'
            'f23c8798f9e2577b45cd28e1deadf9d7752caf54aca47414f429c9f7c78755c9'
            'acce06a23589a86a2f88c1d45e96731c09ba25d7a93c303284d990753a4a206a')
build() {
    cd "$srcdir/$pkgname-$_pkgname-$pkgver"
    mvn clean package
}

package() {
    cd "$srcdir"
    install -Dm755 rest-client.sh "${pkgdir}/usr/bin/rest-client"
    install -Dm644 rest-client.desktop "${pkgdir}/usr/share/applications/rest-client.desktop"

    cd "$pkgname-$_pkgname-$pkgver/restclient-ui/target"
    install -Dm644 "restclient-ui-${pkgver}-jar-with-dependencies.jar" "${pkgdir}/usr/share/rest-client/restclient-ui-jar-with-dependencies.jar"
    install -Dm644 "classes/org/wiztools/restclient/logo_30.png" "${pkgdir}/usr/share/pixmaps/rest-client.png"
}
