# Maintainer: David Hajek <dante4d at gmail dot com>
pkgname=codecgraph
pkgver=20120114
pkgrel=1
pkgdesc="A tool to generate a graph based on the ALSA description of a HDA codec"
arch=('i686' 'x86_64')
url="http://helllabs.org/codecgraph/"
license=('GPL')
depends=('graphviz')
conflicts=('codecgraph')
source=("http://helllabs.org/codecgraph/$pkgname-$pkgver.tar.gz")
md5sums=('30bb1afeda28b7e9b7f36e3b5b98a869')

build() {
  cd "$startdir/src/$pkgname-$pkgver"

  env PREFIX=/usr make DESTDIR=$startdir/pkg install -e || return 1
}

