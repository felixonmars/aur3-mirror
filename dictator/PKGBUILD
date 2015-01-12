# Maintainer: Bartosz Chmura <chmurli@gmail.com>

pkgname=dictator
pkgver=0.9.7
pkgrel=5
pkgdesc=("Program for reading text files by Rapid Serial Visual Projection")
arch=('any')
url=("http://dictator.kieranholland.com/dictator.html")
license=('GPL')
depends=('python2' 'wxgtk' 'wxpython')
options=(!strip)
source=(
	"http://sourceforge.net/projects/dictator/files/dictator/${pkgver}/${pkgname}-${pkgver}.tar.gz"
	dictator.desktop)
sha256sums=(
	'31b132889004bd52bdb2acfbbcfce4429ccd7f7ecccd7401dbcaaf9775427c95'
	'64c22ad4ab04d04e3f2cd77277d98a7ae6a477b71b42c71b58ce84d7d02ae85f')

package () {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py install --root=${pkgdir}/ --optimize=1

  cd ${pkgdir}
  mkdir -p usr/share/applications
  install -m644 ${srcdir}/dictator.desktop usr/share/applications
}
