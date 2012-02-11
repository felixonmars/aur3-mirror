# Maintainer: butterbrot <alexander-hausmann 'at' web 'dot' de>
# Contributor: Gicu GORODENCO <cyclopsihus 'at' gmail 'dot' com>

pkgname=gdp
_pkgalias=gedit-developer-plugins
pkgdesc="Gedit Developer Plugins provides additional editing, checking, and project management features to Gedit"
pkgver=0.5.11
pkgrel=1
url="https://launchpad.net/gdp"
depends=('gedit' 'python2-pocket-lint')
makedepends=('make' 'intltool')
license=('GPL2')
arch=('i686' 'x86_64')
source=("http://launchpad.net/gdp/0.5.x/${pkgver}/+download/${_pkgalias}-${pkgver}.tar.gz")
md5sums=('5e400367a95e28d02fe8af9406f68b1f')

build(){
    cd $srcdir/${_pkgalias}-${pkgver}/
    PYTHON=python2 ./configure --without-home --prefix=/usr
    make
    make DESTDIR=${pkgdir} install
}
