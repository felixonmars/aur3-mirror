# Maintainer: Giorgio Gilestro <giorgio@gilest.ro>
pkgname=picamera-git
pkgver=9ec333c
pkgrel=1
pkgdesc=" pure Python interface to the Raspberry Pi camera module"
arch=('any')
url="http://picamera.readthedocs.org/"
license=('BSD')
depends=('python2')
makedepends=('git')

_gitname="picamera"
_gitroot="https://github.com/waveform80/picamera.git"

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git describe --always | sed 's/-/./g')
}

build() {
 cd $srcdir
 msg "Connecting to GIT server..."
 if [ -d $_gitname ]; then
   cd $_gitname && git pull origin
   msg "The local files are updated."
 else
   git clone --depth=1 $_gitroot $_gitname
 fi
 msg "GIT checkout done or server timeout"
}

package() {
    cd "$srcdir/$_gitname"
    python2 setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
