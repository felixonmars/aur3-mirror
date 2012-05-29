# Maintainer: Edouard Kleinhans <edouard@kleinhans.info>

pkgname=tonicdnscli
pkgver=0.6.1.1
pkgrel=1
pkgdesc="tonicdnscli is TonicDNS Client tool"
arch=('any')
url="https://github.com/mkouhei/tonicdnscli"
license=("GPL2")
depends=('python2')
source=(http://pypi.python.org/packages/source/t/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('5484429e428cf7ffd55464e657d14b03')

build() {
  :
}

package() {
  cd $srcdir/${pkgname}-$pkgver
  python2 setup.py install --root=$pkgdir
}
