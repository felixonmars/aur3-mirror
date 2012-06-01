# Maintainer: Bruno Carlin <self@aerdhyl.eu>
# Contributor: Nathan Owe. <ndowens04 at gmail>
# Contributor: Nitish Padgaonkar <nitishp at gmail>
pkgname=git-svn-helpers
pkgver=0.9
pkgrel=1
pkgdesc="A collection of command line tools that greatly simplify using git for svn repositories."
arch=(any)
url="http://pypi.python.org/pypi/git-svn-helpers/"
license=('BSD')
depends=('python2' 'setuptools' 'python2-jarn.mkrelease' 'git')
source=(http://pypi.python.org/packages/source/g/git-svn-helpers/$pkgname-$pkgver.tar.gz 
        'LICENSE')
md5sums=('f7d1b577096dbb4004595fa81ee4d98a'
         '363d5a2d088c23ed4188260fc5283817')
options=(!emptydirs)

build() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir/ --optimize=1
  install -d $pkgdir/usr/share/licenses/$pkgname
  install -D -m644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
