pkgname=python-glashammer
pkgver=0.1.4
pkgrel=2
pkgdesc="Full stack web framework"
arch=('i686' 'x86_64')
url="http://glashammer.org/"
license=('BSD')
depends=('python>=2.5' 'python-werkzeug' 'python-jinja>=2.0' 'python-wtforms' 'python-simplejson')
makedepends=('setuptools')
source=(http://launchpad.net/glashammer/0.1/$pkgver/+download/Glashammer-$pkgver.tar.gz)
md5sums=(f6999d800d2715dfaf4da3c766dcf7ed)

build() {
  cd Glashammer-$pkgver
  python ./setup.py install --root=$pkgdir --prefix=/usr || return 1
}

