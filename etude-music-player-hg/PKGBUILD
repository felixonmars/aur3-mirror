# Contributor: Szentandrási István <szentandrasii@gmail.com>

pkgname=etude-music-player-hg
Maintainer=lman
pkgver=130
pkgrel=1
pkgdesc="xmms2 client written in pygtk"
arch=('i686' 'x86_64')
url="http://code.google.com/p/etude-music-player/"
license=('LGPL')
depends=('pygtk' 'pygoocanvas' 'python-notify' 'setuptools' 'pyxdg')
makedepends=('pkgconfig' 'mercurial')
optdepends=("xmms2")
source=()
md5sums=()

_hgroot=https://etude-music-player.googlecode.com/hg/
_hgrepo=etude

build() {
    
    msg "Starting setup..."
    
    cd ${_hgrepo}
    python2 setup.py install --root=${startdir}/pkg
}

