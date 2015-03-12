# Maintainer: Rafał Michalski <plum.michalski at gmail dot com>
pkgname='burp-ui'
pkgver='0.0.6'
pkgrel='2'
pkgdesc='Burp-UI is a web-ui for burp backup written in python with Flask and jQuery/Bootstrap'
arch=('any')
url='https://git.ziirish.me/ziirish/burp-ui'
license=('BSD 3-clause')
depends=('python2-flask' 'python2-flask-wtf' 'python2-flask-login' 'python2' 'burp-backup')
makedepends=('setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://git.ziirish.me/ziirish/burp-ui/repository/archive.tar.gz?ref=0.0.6"
        "${pkgname}.install")
sha256sums=('2b8b12785bad63ffefbe1eeba9437c208b5a2cb5ce3ca7f30704bf2e9d4f0ee8'
            'cdd46e46c4c7a5ebafa055bcb6206856f9f77c77459a20b19ae755a28fc37a4d')

package() {
 cd "${srcdir}/burp-ui.git"
 python2 ./setup.py install --root="${pkgdir}" --prefix="/usr" || return 1

 mkdir -p $pkgdir/etc/burp
 cp share/burpui/etc/buiagent.cfg $pkgdir/etc/burp/
 cp share/burpui/etc/burpui.cfg $pkgdir/etc/burp
 
}



# vim:set ts=2 sw=2 et:
