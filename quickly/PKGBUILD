# Contributor: Gordon JC Pearce <gordon@gjcp.net>

pkgname=quickly
pkgver=12.05
ubuntuver=12.10
pkgrel=1
pkgdesc="A framework for building pygtk apps quickly"
arch=(i686 x86_64)
url="https://wiki.ubuntu.com/Quickly"
license=('GPL')
depends=(glade gedit desktopcouch yelp launchpadlib python2-lxml pygtk)
makedepends=('python2-distutils-extra>=2.18')
source=(https://launchpad.net/$pkgname/$ubuntuver/$pkgver/+download/${pkgname}-${pkgver}.tar.gz
    quickly-python2.patch)
md5sums=('668f85349ac716f78fc578fadb6f1aee'
         'afcdced631ebee2ea313561c6875faf0')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Change to use python2
    patch -p1 < ${srcdir}/quickly-python2.patch

    python2 setup.py install --root=${startdir}/pkg || return 1
}

# vim:set ts=2 sw=2 et:
