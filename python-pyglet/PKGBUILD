# Contributor: Allen Li <darkfeline@abagofapples.com>
# Contributor: Eric Toombs <ewtoombs@uwaterloo.ca>
pkgname=python-pyglet
pkgver=1.2hg
pkgrel=1
pkgdesc="A cross-platform windowing and multimedia library"
arch=(any)
url="http://pyglet.org"
license=('BSD')
depends=('python' 'glu')
optdepends=(
    'avbin: for compressed audio/video'
    'openal: for audio'
    'gdk-pixbuf2: for images other than PNG and BMP'
    )
makedepends=('python-distribute' 'mercurial')
source=("hg+https://code.google.com/p/pyglet/")
md5sums=("SKIP")

build() {
  cd $srcdir/pyglet
  python setup.py build
}

package() {
  cd $srcdir/pyglet
  python setup.py install --root=$pkgdir --optimize=1
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  cp $srcdir/pyglet/LICENSE $pkgdir/usr/share/licenses/$pkgname
}
