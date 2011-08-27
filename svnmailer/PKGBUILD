# Contributor: Jared Casper <jaredcasper@gmail.com>
pkgname=svnmailer
pkgver=1.0.8
pkgrel=1
pkgdesc="a tool to post subversion repository commit information by mail, news or XML (to a CIA tracker)"
arch=(i686 x86_64)
url="http://opensource.perlig.de/svnmailer/"
license=('apache')
depends=(pysvn python subversion)
source=(http://storage.perlig.de/svnmailer/$pkgname-$pkgver.tar.bz2)
md5sums=('b4ea9caff6db64e7a415ac467e5e4b19') 

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir
}
