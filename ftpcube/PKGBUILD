# Maintainer : skydrome <irc.freenode.net>
# Contributor: rayte <rabyte.at.pen.dot.tj>
# Contributor: Dan "ProgDan" Vratil <progdan@progdansoft.com>
# Contributor: Nathan O <ndowens.aur at gmail dot com>
# Contributor: Lex Black <autumn-wind at web dot de>

pkgname=ftpcube
pkgver=0.5.1
pkgrel=7
pkgdesc="A multi-platform graphical (S)FTP client written in Python"
arch=('any')
url="http://ftpcube.sourceforge.net"
license=('Artistic v1.0')
depends=('wxpython' 'python2')
optdepends=('python-paramiko: for sftp support')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('3eb93ae44fa552ec50a24b7882198dd1')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    python2 setup.py build
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    python2 setup.py install --root=${pkgdir} --install-scripts=/usr/bin
    install -m644 -D COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
    install -m644 -D locale/en/LC_MESSAGES/ftpcube.po ${pkgdir}/usr/share/locale/en/LC_MESSAGES/ftpcube.po
}

