# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>
# Contributor: shamrok <szamrok@gmail.com>
# Contributor: scj <scj archlinux us>

pkgname=python2-levenshtein
pkgver=0.10.2
pkgrel=1
pkgdesc="Python 2.x lib for Levenshtein distance or Jaro-Winkler algorithms."
url="http://pypi.python.org/pypi/python-Levenshtein/"
license="GPL"
arch=('i686' 'x86_64')
depends=('python2')
source=(http://pypi.python.org/packages/source/p/python-Levenshtein/python-Levenshtein-$pkgver.tar.gz)
md5sums=('c8af7296dc640abdf511614ee677bbb8')

package() 
{
  cd $srcdir/python-Levenshtein-$pkgver
  python2 setup.py build install --prefix=/usr/ --root=$pkgdir
}
