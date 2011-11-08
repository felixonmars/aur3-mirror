# Maintainer: Hideyuki Tanaka <tanaka.hideyuki@gmail.com>
pkgname=jubatus
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="Distributed Online Machine Learning Framework"
arch=('x86_64')
url="http://jubat.us/"
license=('LGPL2')
groups=()
depends=('gcc' 'pficommon>=1.3.1' 'msgpack>=0.5.7' 'google-glog' 're2c')
makedepends=('pkg-config')
checkdepends=()
optdepends=('mecab-ipadic-utf8: for morphological analysis' 'zookeeper: for managing distributed system')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($pkgname-$pkgver.tar.bz2)
noextract=()
md5sums=('454b01e9e27323143fea5bd999263293')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export FLAGS=''
  if which mecab-config > /dev/null; then export FLAGS='--enable-mecab'; fi
  ./waf configure --prefix=/usr $FLAGS || ./waf configure --prefix=/usr $FLAGS --disable-zookeeper
  ./waf build
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  ./waf --checkall
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  ./waf --destdir="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
