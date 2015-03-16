#Maintainer: "Dimitri Merejkowsky dmerejkowsky@aldebaran-robotics.com"

pkgbase=python-jenkins
pkgname=(python-jenkins python2-jenkins)
pkgver=0.4.5
pkgrel=1
pkgdesc='Python API for managing jobs and nodes in a Jenkins CI instance'
url='https://github.com/stackforge/python-jenkins'
arch=('any')
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/stackforge/python-jenkins/archive/$pkgver.tar.gz")
md5sums=('f76820b8258119017e0ee068bd440bc8')

prepare() {
  cp -r $srcdir/python{,2}-jenkins-$pkgver
}

build() {
  cd $srcdir/python2-jenkins-$pkgver
  python2 setup.py build
  cd $srcdir/python-jenkins-$pkgver
  python setup.py build
}

package_python2-jenkins() {
  depends=('python2')
  cd $srcdir/python2-jenkins-$pkgver
  python2 setup.py install --root=$pkgdir --optimize=1
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}

package_python-jenkins() {
  depends=('python')
  cd $srcdir/python-jenkins-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}

# vim:set ts=2 sw=2 et:
