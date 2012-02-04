# Contributor: Bernard Baeyens (berbae) <berbae52 at sfr dot fr>

pkgname=pan-dev
pkgver=20120129
pkgrel=1
pkgdesc="A powerful Newsgroup Article reader for GTK+"
arch=('i686' 'x86_64')
url="http://git.gnome.org/browse/pan2/"
license=('GPL2')
depends=('gtk3' 'gmime' 'gtkspell3-dev')
makedepends=('gnome-common' 'intltool' 'git')
conflicts=('pan' 'pan-git')
options=('!makeflags')
source=('build-with-gtkspell3.patch')
sha1sums=('c01602d7f8ea69506eb4645c80a4f455c1f18919')

_gitroot="git://git.gnome.org/pan2"
_gitname="pan2"

build() {
  cd $srcdir
  msg "Connecting to the GIT repository..."

  if [[ -d $srcdir/$_gitname ]] ; then
      cd $_gitname
      msg "Cleaning working directory."
      git clean -qxf
      git reset --hard
      msg "Updating local files."
      git pull origin
      msg "The local files are updated."
  else
      git clone $_gitroot
  fi

  msg "GIT checkout done"

  cd $srcdir/$_gitname

  patch -Np1 -i $srcdir/build-with-gtkspell3.patch

  ./autogen.sh --prefix=/usr --with-gtk3 --disable-gkr
  make
}

package() {
  cd $srcdir/$_gitname
  make DESTDIR="${pkgdir}" install
}
