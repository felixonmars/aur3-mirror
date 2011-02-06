#Maintainer: cwchen <linuxisfun0104@gmail.com>

pkgname=python24-elementtree
pkgver=1.2.6
pkgrel=2
pkgdesc="Provides light-weight components for working with XML"
arch=('i686' 'x86_64')
license=('PYTHON')
url="http://effbot.org/zone/element-index.htm"
depends=('python24')
source=(http://effbot.org/media/downloads/elementtree-${pkgver}-20050316.tar.gz)
md5sums=('e1b21716be8bfff8bf192fc3880ad008')

build() {
    cd ${srcdir}/elementtree-${pkgver}*
    python2.4 setup.py install --root=${pkgdir} || return 1
}

