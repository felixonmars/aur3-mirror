# Contributor: Vincent Berset <msieurhappy@gmail.com>

pkgname=helm
pkgver=0.4
pkgrel=1
pkgdesc="helm is a system monitor written in python"
arch=('any')
url="http://helm.last-exile.org/"
license=('GPL3')
depends=('python2' 'pygtk' 'python-imaging' 'python-xlib')
makedepends=('python2')
source=("http://helm.last-exile.org/sources/helm-${pkgver}.tar.bz2")
md5sums=('bd281b9d273a95721fd4ffdae4048d3e')

build() {
  cd $srcdir/$pkgname-$pkgver
  sed -i 's/python/python2/g' helm_launcher.py
  python2 ./setup.py install --root=$pkgdir
}
