# Maintainer: Yosef Or Boczko <yoseforb@gmail.com>

_pkgname=geany-vala-toys
pkgname=$_pkgname-git
pkgver=20130728
pkgrel=1
pkgdesc="Collection of plugins to made vala development with geany"
arch=('i686' 'x86_64')
url="https://github.com/gandalfn/geany-vala-toys/"
license=('LGPLv3')
depends=('gtk2' 'libtool' 'gettext' 'geany' 'gdl2' 'devhelp' 'libxml2>=2.7.8' 'webkitgtk2>=1.8.1' 'libwnck' 'gconf')
makedepends=('git' 'intltool' 'automake' 'autoconf' 'vala')
replaces=('geany-vala-toys')
provides=('geany-vala-toys')
conflicts=('geany-vala-toys')

_gitroot="https://github.com/gandalfn/geany-vala-toys.git"
_gitname="geany-vala-toys"

build() {
  cd $srcdir
  msg "Connecting to GIT server...."

  if [ -d $srcdir/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  msg "Starting build"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="${pkgdir}" install
  rm -rf "$srcdir/$_gitname-build"
}
