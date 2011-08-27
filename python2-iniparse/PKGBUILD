# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: vnoel
# Contributor: Dino Krtanjek <krtanjekdino@gmail.com>

pkgname=python2-iniparse
pkgver=0.4
pkgrel=3
pkgdesc='.ini file parser library for Python.'
arch=('any')
license=('MIT')
url='http://code.google.com/p/iniparse'
depends=('python2')
conflicts=('python-iniparse')
source=("http://iniparse.googlecode.com/files/iniparse-${pkgver}.tar.gz")
md5sums=('5e573e9e9733d97623881ce9bbe5eca6')
sha1sums=('2b2af8a19f3e5c212c27d7c524cd748fa0b38650')

build() {
  cd ${srcdir}/iniparse-${pkgver}
  python2 ./setup.py build
  python2 ./setup.py install --skip-build --root=${pkgdir} --optimize=1
  mv ${pkgdir}/usr/share/doc/iniparse-${pkgver} ${pkgdir}/usr/share/doc/python-iniparse-${pkgver}
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim:set ts=2 sw=2 et:
