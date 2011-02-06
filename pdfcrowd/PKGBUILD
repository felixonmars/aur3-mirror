#Contributor: lang2 <wenzhi.liang@gmail.com>

pkgname=pdfcrowd
pkgver=1.5
pkgrel=1
pkgdesc="python API for pdfcrowd.com"
url="http://pdfcrowd.com/doc/api/#python"
depends=('python')
arch=(any)
license=('GPL')
source=('http://pdfcrowd.com/static/clients/python/pdfcrowd-1.5.zip')
md5sums=('db53d38012ca6f998da873b47b8e3425')

build() 
{
  cd $startdir/src/$pkgname-$pkgver
  python setup.py install --root=$startdir/pkg/
}
