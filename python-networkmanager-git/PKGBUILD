# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>

pkgbase=python-networkmanager-git
pkgname=('python-networkmanager-git' 'python2-networkmanager-git')
pkgver=0.9.13
pkgrel=1
pkgdesc="Easy communication with NetworkManager"
arch=('any')
url="https://github.com/seveas/python-networkmanager"
license=('LGPL3')
makedepends=('python-dbus' 'python2-dbus')
source=("git://github.com/seveas/${pkgbase//-git/}")
sha512sums=('SKIP')


pkgver() {
  cd "${pkgbase//-git/}"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package_python-networkmanager-git() {
  pkgdesc+=" (Python3.x)"
  depends=('python-dbus')

  cd "${pkgbase//-git/}"
  python setup.py install --root="$pkgdir/" --prefix=/usr
}

package_python2-networkmanager-git() {
  pkgdesc+=" (Python2.x)"
  depends=('python2-dbus')

  cd "${pkgbase//-git/}"
  python2 setup.py install --root="$pkgdir/" --prefix=/usr
  mv $pkgdir/usr/bin/n-m $pkgdir/usr/bin/n-m2
}
