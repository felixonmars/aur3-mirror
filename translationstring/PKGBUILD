# Maintainer: Damien Churchill <damoxc@gmail.com>

pkgname=translationstring
pkgver=0.3
pkgrel=1
pkgdesc="Utility library for i18n relied on by various Repoze packages"
license=('custom:BSD')
arch=('i686' 'x86_64')
url="http://www.repoze.org"
depends=('python2')
source=(http://pypi.python.org/packages/source/t/translationstring/translationstring-${pkgver}.tar.gz)
md5sums=('9cba042671c0cbf558faf2082b34658b')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}
