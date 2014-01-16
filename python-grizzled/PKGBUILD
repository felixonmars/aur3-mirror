# Maintainer: Marat Akhin <Marat.Akhin@gmail.com>

pkgname=python-grizzled
pkgver=1.0.3
pkgrel=2
arch=('i686' 'x86_64')
license=('BSD')
pkgdesc="General-purpose Python utility library"
url="http://software.clapper.org/grizzled-python/"
depends=('python2' 'python2-distribute')
makedepends=('git')

_gitroot="http://github.com/bmc/grizzled-python.git"
_gitname="grizzled-python"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  mv $srcdir/$_gitname $srcdir/$pkgname-$pkgver

  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir

  # Install the BSD license
  install -m755 -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 "$srcdir/$pkgname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname"
}
