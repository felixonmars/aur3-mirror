# Maintener: Alexey Dubinin <DubininAlexey at gmail dot com>
pkgname=ooxcb-git
pkgver=20111014
pkgrel=1
pkgdesc="An object-oriented X Python binding based on xpyb"
arch=('i686' 'x86_64')
url="http://docs.samurai-x.org/ooxcb/"
license=('BSD')
depends=('libxcb' 'python2>=2.5')
makedepends=('git' 'setuptools')
optdepends=('cairo-xcb: for using ooxcb cairo bindings')
provides=('ooxcb')
conflicts=('ooxcb')
source=()
md5sums=()

_gitroot="git://samurai-x.org/ooxcb.git"
_gitname="ooxcb"
_gitbranch="master"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ ! -d "$_gitname" ] ; then
    git clone "$_gitroot"
  fi

  cd "$_gitname"
  git pull origin "$_gitbranch"

  msg2 "GIT checkout done or server timeout"
  msg "Starting make..."

  [ -d "$srcdir/$_gitname-build" ] && rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  python2 setup.py install --prefix=/usr --root="$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/ooxcb/LICENSE" 
  install -dm755 "$pkgdir/usr/share/ooxcb/"
  cp -R "examples/" "$pkgdir/usr/share/ooxcb/"
} 
