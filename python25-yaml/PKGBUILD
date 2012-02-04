pkgname=python25-yaml
pkgver=3.09
pkgrel=1
pkgdesc="Python bindings for YAML, using fast libYAML library"
arch=('i686' 'x86_64')
url="http://pyyaml.org"
license=('MIT')
makedepends=('python' 'python25' 'libyaml')
install='python-yaml.install'
source=(http://pyyaml.org/download/pyyaml/PyYAML-$pkgver.tar.gz)
md5sums=('f219af2361e87fdc5e85e95b84c11d87')

build() {
  cd $srcdir/PyYAML-$pkgver
  python2.5 setup.py install --prefix=/usr --root=$pkgdir
  install -m644 -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
