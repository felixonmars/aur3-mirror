# Contributor: Fazlul Shahriar <fshahriar@gmail.com>
pkgname=python-dap
pkgver=2.2.6.7
pkgrel=1
pkgdesc="DAP (Data Access Protocol) client and server for Python."
arch=('i686' 'x86_64')
url="http://pydap.org/2.x/"
license=('MIT')
depends=('python' 'httplib2')
makedepends=('setuptools')
optdepends=('python-paste: server support'
            'python-paste-script: server support'
            'python-paste-deploy: server support'
            'python-cheetah: server support')
            # WSGIFilter is required for proxy support
            # but there is no package for it
source=("http://pypi.python.org/packages/source/d/dap/dap-$pkgver.tar.gz")
md5sums=('3c66004a63eec7ecc9e471a29f4ccc8a')

build() {
  cd "$srcdir/dap-$pkgver"
  python setup.py install --root=$pkgdir
  
  install -Dm644  LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
# vim:set ts=2 sw=2 et:
