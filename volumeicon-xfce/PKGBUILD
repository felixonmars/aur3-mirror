pkgname=volumeicon-xfce
pkgver=20130902
pkgrel=1
pkgdesc="Lightweight volume control that sits in systray, with disabled notify support."
arch=(any)
url="http://softwarebakery.com/maato/volumeicon.html"
license=('GPL3')
depends=('gtk3' 'alsa-lib')

conflicts=('volumeicon')
replaces=('volumeicon')
makedepends=('git')

_gitroot="git://github.com/Maato/volumeicon.git"
_gitname="volumeicon"

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

  ./autogen.sh
  ./configure --prefix=/usr --with-default-mixerapp=xfce4-mixer
  make
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR="$pkgdir/" install
}