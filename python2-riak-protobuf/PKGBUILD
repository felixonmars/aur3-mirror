# Maintainer: William Robertson <wkr@wkr.io>
pkgname=python2-riak-protobuf
pkgver=2.0.0.14
pkgrel=1
pkgdesc='Protobuf definitions for the Riak NoSQL store.'
arch=('any')
url='https://github.com/basho/riak_pb'
license=('Apache')
groups=()
depends=('python2' 'python2-protobuf')
makedepends=('python2-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://pypi.python.org/packages/source/r/riak_pb/riak_pb-$pkgver.tar.gz")
md5sums=('0dff04564191f3dbe66790e77f91347b')

package() {
    cd "$srcdir/riak_pb-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
