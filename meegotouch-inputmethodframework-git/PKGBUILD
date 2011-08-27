# Contributor: Jon Nordby <jononor@gmail.com>
# Maintainer: Jon Nordby <jononor@gmail.com>

_pkgname=meegotouch-inputmethodframework
pkgname=$_pkgname-git
pkgver=20110528
pkgrel=1
pkgdesc="MeegoTouch Inputmethod Framework"
arch=('x86_64' 'i686')
url="http://wiki.meego.com/Maliit"
license=('LGPL')
makedepends=('git')
depends=('qt' 'libmeegotouch')
provides=($_pkgname)
conflicts=($_pkgname)
install=meegotouch-inputmethodframework.install
source=()
md5sums=()

_gitroot="git://gitorious.org/meegotouch/meegotouch-inputmethodframework.git"
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
  # Note: libmeegotouch dep can be removed using CONFIG+=nomeegotouch
  qmake CONFIG+=notests CONFIG+=noduicontrolpanel
  make
}

package() {
  cd "$srcdir/$_gitname-build"

  make install INSTALL_ROOT="$pkgdir/"
} 
