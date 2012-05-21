# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=python-pyo
pkgver=0.6.1
pkgrel=1
pkgdesc="A Python module written in C to help digital signal processing script creation"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pyo/"
license=('GPL')
depends=('python2' 'portmidi' 'portaudio' 'liblo')
provides=('python2-pyo')
conflicts=('python2-pyo' 'python2-pyo-svn')
source=("http://pyo.googlecode.com/files/pyo_$pkgver-src.tar.bz2"
        "http://pyo.googlecode.com/files/pyo_$pkgver-doc.tar.bz2")
md5sums=('3f72500a02243546178d45dc287fa204'
         'c7f2395e3e196bbd79b2d073a0717207')

build() {
  cd "$srcdir/pyo_$pkgver-src"

  export PYTHON="python2"

  # build both with and without double
  python2 setup.py build --use-double --use-jack
  python2 setup.py build --use-jack
}

package() {
  cd "$srcdir/pyo_$pkgver-src"

  # install both with and without double
  python2 setup.py install {--use-double,} \
                            --use-jack \
                            --root="$pkgdir/"

  # examples
  install -d "$pkgdir/usr/share/$pkgname"
  cp -a examples "$pkgdir/usr/share/$pkgname"

  # docs
  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp -a ../pyo_$pkgver-doc/* "$pkgdir/usr/share/doc/$pkgname"

  # python2 fix
  sed -i "s|env python|&2|g" `grep -rl "env python" "$pkgdir"`
}
