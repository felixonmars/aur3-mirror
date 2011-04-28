# Maintainer: David Vilar <davvil@gmail.com>
pkgname=gnome-socket-applet-git
pkgver=20110428
pkgrel=1
pkgdesc="Gnome panel applet that reads from a socket and displays the result"
arch=('i686' 'x86_64')
url="http://jaspervdj.be/posts/2011-02-26-gnome-socket-applet.html"
license=('GPL')
makedepends=('git')

_gitroot="https://github.com/jaspervdj/gnome-socket-applet.git"
_gitname="gnome-socket-applet"

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

  #
  # BUILD HERE
  #

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  install -D $_gitname.server $pkgdir/usr/lib/bonobo/servers/$_gitname.server
  install -D $_gitname        $pkgdir/usr/lib/gnome-panel/$_gitname
  install -D $_gitname.png    $pkgdir/usr/share/pixmaps/$_gitname.png
} 
