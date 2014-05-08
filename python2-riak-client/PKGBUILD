# Maintainer: William Robertson <wkr@wkr.io>
pkgname=python2-riak-client
pkgver=2.0.3
pkgrel=1
pkgdesc='Python client for the Riak NoSQL store.'
arch=('any')
url='http://basho.github.io/riak-python-client/'
license=('Apache')
groups=()
depends=('python2' 'python2-protobuf' 'python2-riak-protobuf')
makedepends=('python2-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://pypi.python.org/packages/source/r/riak/riak-$pkgver.tar.gz")
md5sums=('876dea2b30ccdcc0cb285e329d0119ef')

package() {
    cd "$srcdir/riak-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
