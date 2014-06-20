# Maintainer: Stephen Blythe <stephen@urwick.co.uk>
pkgname=python2-netctl
pkgver=0.2.0
pkgrel=2
pkgdesc="Trivial interface to the netctl systemd script"
arch=('any')
url="https://github.com/shblythe/python2-netctl"
depends=('python2')
makedepends=('python2-distribute' )
license=('GPL3')
arch=('any')
source=('https://pypi.python.org/packages/source/n/netctl/netctl-0.2.0.zip')
md5sums=('68f46baf67843515c4024ddb1282bf79')

build() {
    cd $srcdir/netctl-0.2.0
    python2 setup.py build
}

package() {
    cd $srcdir/netctl-0.2.0
    python2 setup.py install --root="$pkgdir" --optimize=1 
}
