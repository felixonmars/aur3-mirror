# Contributor: shamrok <szamrok@gmail.com>

pkgname=pywurfl
pkgver=6.3.0b
pkgrel=1
pkgdesc="pywurfl is a Python language package that makes dealing with the WURFL in Python a little easier."
url="http://wurfl.sourceforge.net/python/index.php"
license="GPL"
arch=('i686')
depends=('python' 'python-elementtree' 'pyparsing')
makedepends=('setuptools')
source=(http://wurfl.sourceforge.net/python/$pkgname-$pkgver.tar.bz2)
md5sums=('587ff8ba08085b1f2bed1fd2584c352e')

build() 
{
 cd $startdir/src/$pkgname-$pkgver
 python setup.py build install --prefix=/usr/ --root=$startdir/pkg
}
