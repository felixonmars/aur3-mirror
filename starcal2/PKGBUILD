# Maintainer: Saeed Rasooli <saeed.gnu at gmail dot com>

pkgname=starcal2
pkgver=1.9.1
pkgrel=1
pkgdesc='A full-featured international calendar writen in Python'
arch=('any')
url="http://starcal.sourceforge.net"
license=('GPLv3')
depends=('python2>=2.6' 'pygtk>=2.8' 'pygobject' 'python2-numpy')
optdepends=('python2-qt' 'python-gnomeapplet' 'kdebindings-python' 'python2-gnomevfs')
conflicts=('starcal-git')
source=(http://sourceforge.net/projects/starcal/files/starcal2/1.9/starcal2-1.9.1.zip)
md5sums=('1c9d635c6b2b49b53bde2abacb887565')

build() {
  cd "$srcdir/$pkgname/"
  ./install $pkgdir --for-pkg
}

# vim:set ts=2 sw=2 et:
