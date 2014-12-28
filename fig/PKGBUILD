# Maintainer: Vincent Demeester <vincent@sbr.io>
# Contributor: Josh VanderLinden <arch@cloudlery.com>
python=python2

pkgname=fig
pkgver=1.0.1
pkgrel=2
pkgdesc="Fast, isolated development environments using Docker"
depends=('python2-docopt' 'python2-yaml' 'python2-requests' 'python2-pip'
         'python2-six' 'python2-texttable' 'python2-websocket-client-pebble'
         'python2-docker-py' 'python2-dockerpty' 'docker' 'python2-certifi')
arch=('any')
source=(https://pypi.python.org/packages/source/f/fig/fig-$pkgver.tar.gz)
md5sums=(e1c82296fe2362fae21b3cb0dfee8cb2)

url="http://www.fig.sh/"
license="BSD"

build() {
    cd $srcdir/$pkgname-$pkgver

    sed -i 's/==/>=/g' requirements.txt

    $python setup.py build || return 1
}

package() {
    cd $srcdir/$pkgname-$pkgver

    $python setup.py install --root=$pkgdir

    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
