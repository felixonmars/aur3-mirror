# Maintainer: Renato Garcia <fgar.renato@gmail.com>
# Contributor: yescalona <yescaloan[at]ug[dot]uchile[dot]cl>

pkgname=ropemacs
pkgver=0.6
pkgrel=4
pkgdesc="Plugin for performing python refactorings in Emacs"
url="http://rope.sourceforge.net/ropemacs.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=('python2-rope' 'pymacs')
install=ropemacs.install
source=(http://downloads.sourceforge.net/rope/${pkgname}-${pkgver}.tar.gz)
md5sums=('7ed3549de6793d53a4bd0e4d7f7952d4')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 ./setup.py install --root=${pkgdir} --prefix=/usr
}
