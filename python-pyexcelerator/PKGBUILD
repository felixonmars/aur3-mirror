#Contributor: Fung Wing Kit <wengee@gmail.com>
pkgname=python-pyexcelerator
pkgver=0.6.4.1
pkgrel=2
pkgdesc="Library for generating Excel 97/2000/XP/2003 and OpenOffice Calc compatible spreadsheets. It's including xls to text, csv and html converters."
arch=(any)
url="http://pyexcelerator.sourceforge.net"
depends=('python2>=2.4')
source=(http://downloads.sourceforge.net/project/pyexcelerator/pyExcelerator/${pkgver}/pyexcelerator-${pkgver}.zip)
license=('BSD License')

build()
{
  cd "$srcdir"/pyexcelerator-$pkgver
  python2 setup.py install --root="$pkgdir"
}

md5sums=('2b49954d2647c846df9bb24cac0980ca')
