# Contributor: Jon Nordby <jononor@gmail.com>
# Maintainer: Jon Nordby <jononor@gmail.com>

_pkgname=meegotouch-inputmethodkeyboard
pkgname=$_pkgname-git
pkgver=20110528
pkgrel=1
pkgdesc="MeegoTouch Inputmethod Keyboard"
arch=('x86_64' 'i686')
url="http://wiki.meego.com/Maliit"
license=('BSD')
makedepends=('git')
depends=('qt' 'libmeegotouch' 'meegotouch-inputmethodframework' 'meegotouch-inputmethodengine')
provides=($_pkgname)
conflicts=($_pkgname)
install=meegotouch-inputmethodkeyboard.install
source=()
md5sums=()

_gitroot="git://gitorious.org/meegotouch/meegotouch-inputmethodkeyboard.git"
_gitname="$_pkgname"

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

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  # BUILD
  qmake -r ./ CONFIG+=notests CONFIG+=noreactionmap
  make
}

package() {
  cd "$srcdir/$_gitname-build"

  make install INSTALL_ROOT="$pkgdir/"
} 
