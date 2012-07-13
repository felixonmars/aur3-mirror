# Maintainer: Martin Bohal <martin.bohal@gmail.com>
pkgname=bzr-upload
pkgver=1.1.0
pkgrel=1
pkgdesc="Upload plugin for the bazaar (bzr) version control system."
arch=('any')
url="https://launchpad.net/${pkgname}"
license=('GPL')
depends=('bzr' 'python2')
source=(https://launchpad.net/bzr-upload/1.1/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz)
md5sums=('5eea5f4e4c3fe2d2ce815f8dd46f5127')


build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py install --prefix'=/usr' --root="${pkgdir}"
}
