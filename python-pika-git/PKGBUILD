# Maintainer: Matthew Sloan <matthew@sloan.cc>
pkgname=python-pika-git
_gitname=pika-python3
pkgver=20140506
pkgrel=1
pkgdesc="Python 3 fork of Pure Python RabbitMQ/AMQP 0-9-1 client library"
arch=('any')
url="https://github.com/renshawbay/pika-python3"
license=('GPL2 MPL')
depends=('python')
options=(!emptydirs)
source=("git://github.com/renshawbay/pika-python3.git")

package() {
    cd "${_gitname}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}

md5sums=('SKIP')
