# Contributor: mathieui <mathieui[@]mathieui.net>
pkgname=gstyle-git
pkgver=20100504
pkgrel=1
pkgdesc="Gstyle is a theme manager for gnome/gtk/compiz"
arch=('i686' 'x86_64')
url="http://www.penguincape.org/"
license=('GPL')
depends=('python' 'gnome-python-desktop-all' 'gnome-python-extras' 'xcur2png')
makedepends=('git')
provides=('gstyle')
install=('gstyle.install')

_gitroot="git://github.com/smolleyes/gstyle.git"
_gitname="gstyle"

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
  cd "$srcdir/$_gitname-build/src"

  #
  # BUILD HERE
  #
  mkdir -p $pkgdir/usr/share/gstyle/
  mkdir -p $pkgdir/usr/bin/

  rm ./lib/bin/xcur2png
  ln -s /usr/bin/xcur2png ./lib/bin/xcur2png || return 1
  cp -Ra ./* $pkgdir/usr/share/gstyle
  cp gstyle $pkgdir/usr/bin/
}
