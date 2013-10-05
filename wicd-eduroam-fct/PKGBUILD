# Maintainer: João Santos <jsantos at krutt dot org> PGP-Key: AAAEE882

pkgname='wicd-eduroam-fct'
pkgver=20131005
pkgrel=1
pkgdesc="wicd-eduroam for the FCT-UNL (pt) should work for most PEAP/MSCHAPV2 too"
arch=('any')
url="http://wicd.sourceforge.net/"
license=('WTFPL')
depends=('wicd')
install=eduroam-fct.install
source=(eduroam-fct)

package(){
    install -Dm 644 eduroam-fct $pkgdir/etc/wicd/encryption/templates/eduroam-fct
}

sha512sums=('76425d079a83ea3a71323bb9a5bdc5cffcadee4fef4cad8b9b3564626d36b69512ba6f1be3634788af1e6e8e2f50f73a4a02ad567e2b2d26ca8aa568143efdce')
