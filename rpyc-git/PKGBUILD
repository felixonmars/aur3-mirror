# Maintainer: cyrus <kornburn@gmail.com>

pkgname=rpyc-git
pkgver=20110505
pkgrel=1
pkgdesc=" Remote Python Call (RPyC), a transparent and symmetric RPC library. (git version)"
arch=('i686' 'x86_64')
url="http://rpyc.wikidot.com"
license=('MIT')
depends=('python2')
makedepends=()
provides=('rpyc=3.1.0')
conflicts=('rpyc')
source=()
md5sums=()

_gitroot="git://github.com/tomerfiliba/rpyc.git"
_gitname="rpyc"

build() {
  cd "$srcdir"

  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Preparing sources..."

  if [ -d $srcdir/$_gitname-build ] ; then
    rm -rf "$srcdir/$_gitname-build"
  fi

  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"

  # license
  msg "Copying license..."
  install -D -m 644 LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE

  # install
  msg "Running setup.py"
  python2 setup.py install --root=${pkgdir} --prefix=/usr
}
          
