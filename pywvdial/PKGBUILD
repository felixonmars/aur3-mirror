# Maintainer: Brian Astrup Mikkelsen <brian@mikkelsen.com>
pkgname=pywvdial
_pkgname=pyWvDial
pkgver=0.5
pkgrel=3
pkgdesc="Graphical frontend for wvDial written in python"
arch=(any)
url=(http://www.develia.org)
depends=(python2 wvdial pygtk)
license=GPLv2
source=(http://www.develia.org/files/$_pkgname-$pkgver.tar.gz)
md5sums=('6ab2c0231583c4179f4fb6f9b6bbbe2c')

build(){
    cd $srcdir/$_pkgname-$pkgver
    python2 setup.py install --prefix=/usr --root=$startdir/pkg 
}
