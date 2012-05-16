# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
pkgname=ubuntu-wallpapers-extra
pkgver=0.1
pkgrel=1
pkgdesc="Ubuntu Wallpapers extra"
arch=('any')
url="http://packages.ubuntu.com/oneiric/ubuntu-wallpapers-extra"
license=('GPL')
makedepends=('libxslt' 'python-distutils-extra')
conflicts=('ubuntu-wallpapers')
source=("http://archive.ubuntu.com/ubuntu/pool/universe/u/${pkgname}/${pkgname}_${pkgver}.tar.gz")
sha256sums=('62914dddb837f4a1396e3b919d06f7df12540139428b3ec24b46b9b3796cddcd')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  xsltproc --novalid -o debian/gconf-defaults debian/wallpapers2gconf.xsl ubuntu-wallpapers-extra.xml.in
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 debian/gconf-defaults "${pkgdir}/usr/share/gconf/defaults/16_${pkgname}"
}

# vim:set ts=2 sw=2 et:
