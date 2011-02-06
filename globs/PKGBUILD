# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=globs
pkgver=0.1
pkgrel=3
pkgdesc="GL Open Benchmark Suite"
url="http://globs.sourceforge.net"
license=""
depends=('pygtk' 'sdl' 'sdl_image')
makedepends=('scons')
conflicts=()
replaces=()
backup=()
install=
source=(http://dl.sourceforge.net/sourceforge/globs/$pkgname-$pkgver.tar.gz)
md5sums=('9de9d8bc9c236f72bfa7c8ba53849bf1')

build() {
  cd $startdir/src/$pkgname-$pkgver
  scons
  scons install root=$startdir/pkg prefix=/usr
  python patchdir.py prefix=/usr
  python setup.py install --root=$startdir/pkg --prefix=/usr  
}
