# Maintainer: Teemu Rytilahti <tpr@iki.fi>
pkgname=hackersh
_pkgname=Hackersh
pkgver=0.2.0
pkgrel=1
pkgdesc="A shell for with Pythonect-like syntax, including wrappers for commonly used security tools"
arch=('any')
url="http://www.hackersh.org/"
license=('GPL')
depends=('python2' 'pythonect' 'python2-prettytable' 'python2-netaddr')
backup=()
options=(!emptydirs)
#https://pypi.python.org/packages/source/H/Hackersh/Hackersh-0.2.0.tar.gz#md5=6343e39b48980ee224ba0f8dd55678e0
source=($_pkgname-$pkgver.tar.gz)
md5sums=('6343e39b48980ee224ba0f8dd55678e0')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
