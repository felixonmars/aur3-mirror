#Maintainer: klassiker <echo dGdvc2NoQGxpdmUuZGUK | base64 -d>

pkgname=pyastra
pkgdesc="Python Assembler Translator"
pkgver=0.0.4.1
pkgrel=1
arch=('i686' 'x86_64')
url=('http://sourceforge.net/projects/pyastra/')
license=('GPL')
makedepends=('setuptools' 'python2' 'sudo')
source=("http://sourceforge.net/projects/pyastra/files/pyastra/$pkgver-preview/Pyastra-$pkgver.tar.gz")
md5sums=('SKIP')

pkgver() {
  printf "%s" "$pkgver"
}

build() {
  cd "$srcdir/Pyastra-$pkgver"
  python2 setup.py build
  sudo python2 setup.py install
  cp "$srcdir/Pyastra-$pkgver/pyastra" "$srcdir/../"
  sed '0,/$/ s//2/' "$srcdir/../pyastra" -i
}
