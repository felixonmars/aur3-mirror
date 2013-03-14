# Maintainer: Arthur Darcet <arthur.darcet@m4x.org>

pkgname=kaoz-clients
pkgver=0.0.1
pkgrel=2
pkgdesc='Client scripts for kaoz (IRC notifier in python by Binet Réseau)'
arch=('any')
url='https://github.com/BinetReseau/kaoz-clients'
license=('MIT')
depends=('socat')
optdepends=('kaoz-git: needs to be installed somewhere in your network' 'python: for python based scripts')
install='kaoz-clients.install'
backup=('usr/share/kaoz-clients/pipes/ircpipe.sh' 'usr/share/kaoz-clients/pipes/ircpipe.py')
source=("${url}/archive/${pkgver}.tar.gz")
md5sums=('d67bca23aa335f0b1322f31ac9bc3ef9')

package() {
    mkdir -p "${pkgdir}/usr/share"
    cp -r "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/share/kaoz-clients"
#    chmod -R u=rwX,g=rX,o=rX "${pkgdir}/usr/share/kaoz-clients/"
}
