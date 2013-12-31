# Maintainer: Maximilian Stein <maxarchpkgbuild@hmamail.com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>
# Contributor: shamrok <szamrok@gmail.com>
# Contributor: scj <scj archlinux us>

pkgname=python-levenshtein
pkgver=0.11.1
pkgrel=1
pkgdesc="Python lib for Levenshtein distance or Jaro-Winkler algorithms."
url="http://pypi.python.org/pypi/python-Levenshtein/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('python2-setuptools')
source=(http://pypi.python.org/packages/source/p/python-Levenshtein/python-Levenshtein-$pkgver.tar.gz)
md5sums=('90a09fdc345a432aaaf799221a0cb300')

package() 
{
  cd $srcdir/python-Levenshtein-$pkgver
  python2 setup.py build install --prefix=/usr/ --root=$pkgdir
}
