# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>

pkgname=python-dispatcher
_pkgname=PyDispatcher
pkgver=2.0.1
pkgrel=1
pkgdesc="Provides loosely-coupled message passing between Python objects"
arch=('any')
url="http://pydispatcher.sourceforge.net/"
license=('custom')
depends=('python' 'setuptools')
options=('!emptydirs')
source=(http://downloads.sourceforge.net/${_pkgname,,[PD]}/${_pkgname}-$pkgver.tar.gz)
md5sums=('8b1695ed6f5bdbda8fbcde82b62d505c')

build() {
  cd $srcdir/${_pkgname}-$pkgver
  python setup.py install --root=$pkgdir || return 1
  install -Dm644 license.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
