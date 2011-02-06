# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Sebastien Binet <binet@farnsworth>
pkgname=python-affinity
pkgver=0.1.0
pkgrel=2
pkgdesc="affinity - control processor affinity on windows and linux"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/affinity"
license=('PSF')
depends=('python' 'linux-api-headers')
source=(http://pypi.python.org/packages/source/a/affinity/affinity-${pkgver}.tar.gz)
md5sums=('cc610cdb05ca675b4089ce2f05796f57')

build() {
  cd $startdir/src/affinity-$pkgver
  python setup.py install --prefix=/usr --root=$startdir/pkg || return 1
}
