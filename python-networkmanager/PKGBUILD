# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgbase=python-networkmanager
pkgname=('python-networkmanager' 'python2-networkmanager')
pkgver=0.9.13
pkgrel=1
pkgdesc="Easy communication with NetworkManager"
arch=('any')
url="https://github.com/seveas/python-networkmanager"
license=('LGPL3')
makedepends=('python-dbus' 'python2-dbus')
source=("https://github.com/seveas/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('ec2538410812396fa93ce9b4bf4a52374123466e76b587a7179cbf326dffbc58a0c302190a7385369153b0a1a403186b2a3439c2ca77a699915e8674921ccc02')


package_python-networkmanager() {
  pkgdesc+=" (Python3.x)"
  depends=('python-dbus')

  cd ${srcdir}/${pkgbase}-${pkgver}
  python setup.py install --root="$pkgdir/" --prefix=/usr
}

package_python2-networkmanager() {
  pkgdesc+=" (Python2.x)"
  depends=('python2-dbus')

  cd ${srcdir}/${pkgbase}-${pkgver}
  python2 setup.py install --root="$pkgdir/" --prefix=/usr
  mv $pkgdir/usr/bin/n-m $pkgdir/usr/bin/n-m2
}
