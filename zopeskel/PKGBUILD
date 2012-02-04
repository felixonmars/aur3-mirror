# Maintainer: cwchen <linuxisfun0104@gmail.com>

pkgname=zopeskel
_pkgname=ZopeSkel
pkgver=2.19
pkgrel=1
pkgdesc="A collection of skeletons for quickstarting Zope projects"
arch=('i686' 'x86_64')
url="http://plone.org/products/zopeskel"
license=('MIT')
depends=('python2' 'python-cheetah' 'pastescript')
source=(http://plone.org/products/${pkgname}/releases/${pkgver}/${_pkgname}-${pkgver}.tar.gz)


build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  sed -i 's/Cheetah>1.0,<=2.2.1/Cheetah>1.0/' setup.py
  python2 setup.py install --root=${pkgdir} || return 1
  install -m644 ${srcdir}/${_pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
}

md5sums=('5dc9737116fc22f7b9193d5b5a74b58b')
