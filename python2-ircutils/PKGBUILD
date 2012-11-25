pkgname=python2-ircutils
pkgver=0.1.3
pkgrel=1
pkgdesc="IRCUtils is a Python framework for communicating with the IRC protocol."
url="http://dev.guardedcode.com/projects/ircutils/"
arch=('any')
license=('GPLv3')
depends=('python2')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=''
source=("http://dev.guardedcode.com/download/ircutils/${pkgver}/ircutils-${pkgver}.tar.gz")
md5sums=('f102455857e8fe2e5e90237adf5891e2')

build() {
  cd ${srcdir}/ircutils-${pkgver}/
  python2 setup.py install --root=${pkgdir}
}

