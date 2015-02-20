# Maintainer: winnie <sergej.schmidt@uni-ulm.de>
# Contributor: N3mes1s <n3mes1s.oxoo@gmail.com>
pkgname=netzob
pkgver=0.4.1
pkgrel=1
pkgdesc="Netzob is an opensource tool which supports the expert in its operations of reverse engineering, evaluation and simulation of communication protocols."
arch=('i686' 'x86_64')
url="http://www.netzob.org"
license=('GPLv3')
depends=('python2' 'strace' 'lsof' 'python2-matplotlib' 'python2-lxml' 'python2-sphinx' 'python2-distribute' 'graphviz' 'python2-ptrace' 'python2-pcapy' 'python2-bitarray' 'impacket' 'python2-gobject' 'python2-babel' 'python2-httplib2')
source=(http://www.netzob.org/repository/$pkgver/Netzob-$pkgver.tar.gz)
md5sums=('775f72c9ba33a0d6a067e5c15bd5ee9c')

build() {
  cd "$srcdir/Netzob-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/Netzob-$pkgver"
  python2 setup.py install --root=$pkgdir || return 1
  chmod +r -R $pkgdir/usr # that's ugly I know, am looking for a better solution
}

