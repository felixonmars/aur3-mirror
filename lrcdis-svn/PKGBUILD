# Contributor:   osily <ly50247@gmail.com>

pkgname=lrcdis-svn
_realname=lrcdis
pkgver=103
pkgrel=1
pkgdesc="A bash script for auto download lyrics and display them."
arch=('i686' 'x86_64')
url="http://code.google.com/p/lrcdis"
license=('GPL3')
depends=('bash')
makedepends=('subversion')
provides=('lrcdis')
conflicts=('lrcdis')
_svntrunk=http://lrcdis.googlecode.com/svn/trunk
_svnmod=lrcdis
build() {
    svn co $_svntrunk $_svnmod
    install -d ${pkgdir}/usr/bin
    install -m 0755 ${_svnmod}/$_realname ${pkgdir}/usr/bin/
}

