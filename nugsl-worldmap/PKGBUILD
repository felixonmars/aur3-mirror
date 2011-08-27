# Contributor: Ismael Barros (RazZziel) <razielmine@gmail.com>

pkgname=nugsl-worldmap
pkgver=1.16
pkgrel=1
pkgdesc="WikiMedia world map tool."
arch=('i686')
url="http://gsl-nagoya-u.net/appendix/software/worldmap/"
license=('GPL')
conflicts=()
depends=('python' 'nugsl-tagtool')
source=(http://gsl-nagoya-u.net/appendix/software/tagtool/$pkgname-$pkgver.tgz)
md5sums=('e476bccfbad70bdc0bd5921a230bd91b')


build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py bdist
  tar -xf dist/$pkgname-$pkgver.linux-i686.tar.gz -C $pkgdir
}
