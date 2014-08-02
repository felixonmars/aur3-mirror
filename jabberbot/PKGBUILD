# Maintainer: Florian Pritz <bluewind@xinu.at>
pkgname=jabberbot
pkgver=0.15
pkgrel=2
pkgdesc="A simple Jabber Bot for Python"
arch=('any')
url="http://thpinfo.com/2007/python-jabberbot/"
license=('GPLv3')
depends=('python2' 'xmpppy')
source=("http://thpinfo.com/2007/python-jabberbot/jabberbot-$pkgver.tar.gz")
md5sums=('081be2f6d8c82740b9906bf5b8562e7d')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  export PYTHON=python2
  python2 setup.py install --prefix="$pkgdir/usr/" install
}

# vim:set ts=2 sw=2 et:
