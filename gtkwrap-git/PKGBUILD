# Maintainer: DUCRETTET Philippe <ecolinux@gmx.fr>

_pkgname=gtkwrap
pkgname=gtkwrap-git
pkgver=$(date +%Y%m%d)
pkgrel=1
pkgdesc="Create Your gui in Glade(GtkBuilder) and use it in your shell scripts."
arch=('i686' 'x86_64')
url="https://github.com/abecadel/gtkwrap"
license=('GPL')
depends=('glade')
conflicts=( 'gtkwrap' )
replaces=( 'gtkwrap' )
makedepends=('git')
_gitroot=(git://github.com/abecadel/${_pkgname}.git)
_gitname=anonymous

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  cd $srcdir/$_gitname
  make
}

package() {
  cd $pkgdir
  dir="usr usr/bin usr/share usr/share/gtk-wrap usr/share/gtk-wrap/DEMO"
  for i in $dir ; do
	mkdir $i
  done
  cd $srcdir/$_gitname
  install -D -m755 gtk-wrap $pkgdir/usr/bin/gtk-wrap
  install -D -m644 DEMO/* $pkgdir/usr/share/gtk-wrap/DEMO
}
