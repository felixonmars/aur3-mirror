# Maintainer: Mitchell Nemitz <mitchell.nemitz@gmail.com>

pkgname=volume-applet
pkgver=0.6.2
pkgrel=1
pkgdesc="A simple volume applet for Alsa-based systems written in Python."
arch=('any')
url="http://code.google.com/p/volume-applet/"
license=('GPL')
depends=('python2' 'pygtk' 'python-pyalsaaudio')
source=("http://volume-applet.googlecode.com/files/${pkgname}-${pkgver}.tar.bz2")
sha1sums=('0961eae8959124df7c72c2dd7b96a55d93ae17b6')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python2 setup.py install --root="$pkgdir"
}
