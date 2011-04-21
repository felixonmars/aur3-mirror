# Contributor: Morgan LEFIEUX <comete_AT_archlinuxfr.org>
# Maintainer: Nathan O <ndowens04 at gmail dot com>
pkgname=ldaptor
pkgver=0.0.43
pkgrel=3
pkgdesc="A set of pure-Python LDAP client programs, applications and a programming library."
license=('GPL')
arch=('any')
url="http://www.inoi.fi/open/trac/ldaptor/wiki"
depends=('python2')
source=("http://ftp.debian.org/debian/pool/main/l/${pkgname}/${pkgname}_${pkgver}+debian1.orig.tar.gz")
md5sums=('2c76106628d01d13c43728a631a1048b')

build() {
    cd $srcdir/${pkgname}-${pkgver}/
    python2 setup.py build
}

package() {
	cd $srcdir/${pkgname}-${pkgver}/
    python2 setup.py install --root ${pkgdir}
}
