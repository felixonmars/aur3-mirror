# Contributor: Kosava <kosava@archlinux.us>

pkgname=schooltool
pkgver=2.4.2
pkgrel=1
pkgdesc="SchoolTool is a student information system for primary and secondary schools around the world."
arch=('i686' 'x86_64')
url="https://launchpad.net/schooltool"
license=('GPL')
depends=('python2-imaging' 'python2-zope-interface' 'icu')
makedepends=('python2-setuptools')
conflicts=('schooltool-bzr')
source=("http://launchpad.net/$pkgname/flourish/$pkgver/+download/$pkgname-$pkgver.tar.gz")
md5sums=('166ab1c1af09603dcbf53e018ba2d7b8')


package() {
   cd $srcdir/$pkgname-$pkgver
   python2 setup.py --prefix=/usr install --root="${pkgdir}" --optimize=1
}
