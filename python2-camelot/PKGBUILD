# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer:  Sergey Mastykov <smastykov[at]gmail[dot]com>
pkgname=python2-camelot
pkgver=12.06.29
pkgrel=1
pkgdesc="A python GUI framework on top of Sqlalchemy and Qt, inspired by the Django admin interface."
arch=('any')
url="http://www.python-camelot.com/"
license=('GPL, Commercial')
depends=('python2' 'qt>=4.7' 'python2-pyqt>=4.8' 'python2-sqlalchemy>=0.7.2' 'python2-migrate>=0.7.1' 'python2-jinja>=2.5.5' 'python2-chardet>=1.0.1' 'python2-xlwt>=0.7.2' 'python2-xlrd>=0.5.2')
source=(http://pypi.python.org/packages/source/C/Camelot/Camelot-$pkgver.tar.gz)
sha256sums=('6ec7de2c388fb74aec44d2995069ef25129934315399d4462ff1846a38afd310')

package() {
  cd "$srcdir/Camelot-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}


# vim:set ts=2 sw=2 et:
