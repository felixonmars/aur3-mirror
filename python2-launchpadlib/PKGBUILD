# Maintainer: Nick Østergaard <oe.nick at gmail dot com>
# Contributor: Jon Nordby <jononor@gmail.com>
# Contributor: Alexandre Courbot <gnurou@gmail.com>

pkgname=python2-launchpadlib
_pkgname=launchpadlib
pkgver=1.10.3
pkgrel=1
pkgdesc='A free Python library for scripting Launchpad through its web services interface'
arch=('i686' 'x86_64')
url='https://launchpad.net/launchpadlib'
license=('LGPL3')
depends=('python>=2.5' 'python2-lazr-restful' 'python2-lazr-uri'
'python2-lazr-restfulclient' 'python2-keyring' 'python2-oauth')
conflicts=('launchpadlib')
makedepends=('python>=2.5')
source=(http://launchpad.net/$_pkgname/trunk/$pkgver/+download/$_pkgname-$pkgver.tar.gz)
md5sums=('38db14eaeaca69708517017a2acedead')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir
}
