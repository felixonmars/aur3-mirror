# Maintainer: Damien Churchill <damoxc@gmail.com>

pkgname=mex-git
pkgver=20110610
pkgrel=1
pkgdesc="Media Explorer is a media centre application for Linux "
arch=('x86', 'x86_64')
url="http://media-explorer.github.com/"
license=('GPL2')
depends=()
makedepends=('git' 'gnome-common' 'intltool' 'gtk-doc' 'librest>=0.7' 'grilo>=0.1.14' 'mx-1.2' 'gssdp>=0.10' 'gnome-desktop2')
provides=('mex')
conflicts=('mex')

_gitroot=git://github.com/media-explorer/media-explorer
_gitname=media-explorer

build() {
  cd $srcdir
  msg "Connecting to github.com GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated"
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  
  cd "$srcdir/$_gitname"
  git reset --hard

  sed -i 's/python/python2/g' tools/glib-ginterface-gen.py
  sed -i 's/python/python2/g' mex/Makefile*
  sed -i 's/python/python2/g' applets/rebinder/Makefile*

  ./autogen.sh --prefix=/usr --enable-lirc
  make
}

package() {
  cd "$srcdir/$_gitname"
  make install DESTDIR="${pkgdir}"
}
