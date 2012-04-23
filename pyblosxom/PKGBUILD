# Contributor: Pierre Chapuis <catwell@archlinux.us>
# Maintainer:J. W. Birdsong  <jwbirdsongATgmailDOTcom> 
pkgname=pyblosxom
pkgver=1.5.2 
pkgrel=1
pkgdesc="Lightweight file-based weblog system"
arch=('any')
url="http://pyblosxom.sourceforge.net/" 
license=('MIT')
depends=('python2')
makedepends=('python2-distribute')
source=(http://pyblosxom.bluesock.org/download/${pkgname}-${pkgver}.tar.gz)

md5sums=('660de0b07e9ec2d0ac5842bed286db76')

build() {
  cd ${pkgname}-${pkgver}
  python2 setup.py install --root=$pkgdir 
  install -D -m0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}

# vim:set ts=2 sw=2 et

