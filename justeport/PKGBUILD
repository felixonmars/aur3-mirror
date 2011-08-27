# Contributor: William Rea <sillywilly@gmail.com>
pkgname=justeport
pkgver=0.2
pkgrel=1
pkgdesc="Stream audio to your AirPort Express"
url="http://nanocrew.net/sw/justeport"
depends=('mono')
makedepends=('mono')
source=(http://nanocrew.net/sw/justeport/JustePort-$pkgver.tar.gz)
md5sums=('a2afb9543905d0bfc4f29b156201551b')

build() {
  export MONO_SHARED_DIR=$startdir/src/.wabi
  mkdir -p $MONO_SHARED_DIR

  cd $startdir/src/JustePort-$pkgver
  make || return 1
  install -D -m755 JustePort.exe $startdir/pkg/usr/lib/JustePort.exe
  rm -fr $MONO_SHARED_DIR


}
