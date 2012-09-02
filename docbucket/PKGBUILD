# Maintainer: Sébastien Luttringer <seblu@aur.archlinux.org>

pkgname=docbucket
pkgver=0.1
pkgrel=1
pkgdesc='A simple document manager for individuals written with Django'
arch=('any')
url='http://idevelop.org/p/docbucket'
license=('GPL3')
depends=('django' 'python-imaging' 'python2-whoosh' 'python-pymongo' 'cuneiform' 'ghostscript' 'exactimage-svn')
source=(
  "http://pypi.python.org/packages/source/d/$pkgname/$pkgname-$pkgver.tar.gz"
   ) 
md5sums=('4a342d900064fecfcae21f651a9e8851')

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 ft=sh et:
