# Maintainer: David Scholl <djscholl at gmail dot com>
pkgname=pyaudio
pkgver=0.2.4
pkgrel=1
pkgdesc="Python bindings for PortAudio, the cross-platform audio I/O library"
arch=('i686' 'x86_64')
url="http://people.csail.mit.edu/hubert/pyaudio"
license=('MIT')
depends=('python2' 'portaudio')
source=(http://people.csail.mit.edu/hubert/$pkgname/packages/$pkgname-$pkgver.tar.gz)
md5sums=('623809778f3d70254a25492bae63b575')

build() {
  cd $srcdir/PyAudio-$pkgver
  python2 setup.py install --root=$pkgdir || return 1
  install -d $pkgdir/usr/share/licenses/$pkgname
  sed -n -e 17,40p README > $pkgdir/usr/share/licenses/$pkgname/COPYING
}
