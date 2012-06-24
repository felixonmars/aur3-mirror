# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=iulib
pkgver=0.5.2
# the version is based on the ocropus version
# it can be obtained from .hgsubstate in ocropus repository
_pkgver=6ea5be8af69e
pkgrel=2
pkgdesc="A library of image understanding-related algorithms"
arch=('i686' 'x86_64')
url="http://code.google.com/p/iulib/"
license=('APACHE')
depends=('sdl_gfx' 'sdl_image')
makedepends=('mercurial' 'scons' 'python2-numpy' 'swig')
optdepends=('python2-numpy: python interface')
source=()
md5sums=()

build() {
  cd "$srcdir"
  msg "Connecting to $pkgname Mercurial server......."
  if [ -d $pkgname ]; then
    cd "$srcdir"/$pkgname
    hg pull -u -r $_pkgver
    cd "$srcdir"
  else
    hg clone https://iulib.googlecode.com/hg/  $pkgname -r $_pkgver
  fi
  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  if [ -e "$srcdir"/$pkgname-build ]; then
    rm -rf "$srcdir"/$pkgname-build
  fi
  cp -r "$srcdir"/$pkgname "$srcdir"/$pkgname-build
  cd "$srcdir"/$pkgname-build
  
  JOBS=`echo $MAKEFLAGS | sed 's|.*\(-j[1-9][0-9]*\).*|\1|'`
  scons $JOBS prefix=/usr sdl=1
}

package() {
  cd "$srcdir"/$pkgname-build
  scons prefix="$pkgdir"/usr sdl=1 install

  # the python bindings must be compiled after the iulib has been installed to pkgdir
  cd pyswig
  python2 setup.py build_ext \
    --include-dirs="$pkgdir/usr/include" \
    --library-dirs="$pkgdir/usr/lib"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
