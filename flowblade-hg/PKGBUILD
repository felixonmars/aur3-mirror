# Maintainer: sxe <sxxe@gmx.de>

pkgname=flowblade-hg
_pkgname=flowblade
pkgver=20130616
pkgrel=1
pkgdesc="a multitrack non-linear video editor for Linux (hg)"
arch=('any')
url="http://code.google.com/p/flowblade/"
license=('GPL')
depends=( 'ffmpeg' 'pygtk' 'mlt-python-bindings' 'ladspa' 'sox' 'frei0r-plugins' 'python2-gnomevfs' 'python2-numpy' 'python2-imaging')
makedepends=('mercurial')
conflicts=('flowblade')
provides=('flowblade')

install=flowblade.install
source=('hg+https://code.google.com/p/flowblade/')

pkgver() {
    date +%Y%m%d
}

package() {
  cd $srcdir/$_pkgname/${_pkgname}-trunk
  python2 setup.py install --root=$pkgdir/ --install-lib=/usr/share/pyshared --optimize=1
}

md5sums=('SKIP')
