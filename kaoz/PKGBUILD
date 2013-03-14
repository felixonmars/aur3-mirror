# Maintainer: Arthur Darcet <arthur.darcet@m4x.org>

pkgname=kaoz
pkgver=2.0.0
pkgrel=4
pkgdesc="IRC notifier in python by Binet Réseau"
arch=('any')
url='https://github.com/BinetReseau/kaoz'
license=('MIT')
depends=('python' 'python-irc')
optdepends=('python-openssl: To use SSL between server and clients' 'kaoz-clients: Client scripts to interface with pam, nagios, …')
source=("${url}/archive/${pkgver}.tar.gz" 'kaoz.service')
backup=('etc/kaoz.conf')
md5sums=('a31c4a32e4b631943aa522e66a3d645f' '8a1c7986f1efd741285523e0bda61843')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir"
}

package() {
    install -Dm644 ../kaoz.service "${pkgdir}/usr/lib/systemd/system/kaoz.service"
    install -Dm640 "${srcdir}/${pkgname}-${pkgver}/kaoz.example.conf" "${pkgdir}/etc/kaoz.conf"
}
