# Contributor: Daniel Garcia <dani@danigm.net>
# Maintainer: Daniel Garcia <dani@danigm.net>

pkgname=sweetgtk-bzr
pkgver=latest
pkgrel=1
pkgdesc="A microblogging Sweetter/Twitter client"
arch=('any')
url="http://danigm.net/sweetgtk"
license=("GPL3")
depends=('python' 'pygtk' 'python-notify' 'gnome-python-extras')
makedepends=('bzr')

_bzrroot="http://repo.danigm.net/sweetgtk"
_bzrname="sweetgtk"

build() {
  cd "$srcdir"
  msg "Connecting to BZR server...."

  if [ -d $_bzrname ] ; then
    cd $_bzrname && bzr pull
    msg "The local files are updated."
  else
    bzr clone $_bzrroot
    cd $_bzrname
  fi

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_bzrname-build"
  bzr export "$srcdir/$_bzrname-build"
  cd "$srcdir/$_bzrname-build"
  
  #
  # BUILD HERE
  #
  PREFIX=$pkgdir/usr
  DEST=$PREFIX/share/sweetgtk

  install -d $DEST

  cp -rf skel simplejson img $DEST
  install -m 644 sweetgtk.glade *.py $DEST
  
  install -m 644 -D img/sweetgtk.png $PREFIX/share/pixmaps/sweetgtk.png
  install -m 644 -D sweetgtk.desktop $PREFIX/share/applications/sweetgtk.desktop

  install -D -m 755 sweetgtk $PREFIX/bin/sweetgtk
}
