# Contributor: Damien Churchill <damoxc@gmail.com>
pkgname=fbuploader
pkgver=0.1
pkgrel=4
pkgdesc="A PyGtk application for uploading your photos to facebook."
arch=('i686' 'x86_64')
url="http://fbuploader.damoxc.net"
license=('GPLv3')
depends=('pygtk' 'pil' 'pycairo' 'pyxdg' 'setuptools')
source=(http://fbuploader.damoxc.net/files/source/${pkgname}-${pkgver}.tar.gz)
md5sums=(57fc1f42db8662d3b25a79420a70a540)

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    python2 setup.py install --prefix=/usr --root=${pkgdir} || return 1
}
