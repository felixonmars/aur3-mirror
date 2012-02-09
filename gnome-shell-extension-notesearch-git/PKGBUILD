# Contributor: Nazarov Pavel <nazarov.pn@gmail.com>

pkgname=gnome-shell-extension-notesearch-git
pkgver=20120210
pkgrel=2
pkgdesc="A gnome-shell extension which searches Gnote or Tomboy notes and provides them in your shell overview"
arch=('i686' 'x86_64')
url="https://github.com/charkins/gnome-shell-extension-notesearch"
groups=('gnome-shell-extensions')
install=$pkgname.install
license=('GPL3')
optdepends=('tomboy' 'gnote')

_gitroot="git://github.com/charkins/gnome-shell-extension-notesearch.git"
_gitname="gnome-shell-extension-notesearch"

build() {
  msg "Connecting to GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"

  cd ${srcdir}/$_gitname
  ./autogen.sh --prefix=/usr --disable-schemas-compile --sysconfdir=/etc
  make || return 1
  make DESTDIR=${pkgdir} install
}
