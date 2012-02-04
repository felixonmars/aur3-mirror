# Maintainer: Sychopx <infinity.illusion AT gmail DOT com>

pkgname=tweets2pdf
pkgver=0.2.0
pkgrel=1
pkgdesc="Backup your tweets into FANTANSTIC PDF files, with GUI"
arch=('any')
url="http://basiccoder.com/tweets2pdf"
license=('GPL2')
depends=('python2' 'pygtk' 'python-reportlab' 'python-imaging')
source=("http://tweets2pdf.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('cca4541efce9f5834926d7ed3e39ed46')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    python2 setup.py install --root=${pkgdir}
}
