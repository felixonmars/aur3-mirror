# Maintainer: Brad Pitcher <bradpitcher@gmail.com>
# Contributor: Sebastien Binet <binet@lblbox>
# Contributor: AXilleas Pipinellis <axilleas archlinux.gr>

pkgname=python2-rhodecode
pkgver=2.2.5
pkgrel=1
pkgdesc="Open source control management system for Mercurial and GIT with code-reviews"
url="http://rhodecode.org"
arch=('any')
license=('GPL3')
depends=( 'python2' 'mercurial' 'python2-pylons' 'python2-paste' 'git')
optdepends=('python-celery')
source=(http://pypi.python.org/packages/source/R/RhodeCode/RhodeCode-$pkgver.tar.gz)
md5sums=('782a436c6d261b1b547a2c63a81da9c6')

package() {
  cd $srcdir/RhodeCode-$pkgver
  python2 setup.py install --root="$pkgdir/" --optimize=1
}



