# Maintainer: American_Jesus <american.jesus.pt AT gmail DOT com>
# Contributor: jason52lh

pkgname=fusion-icon-git
pkgver=20111030
pkgrel=1
pkgdesc="Tray icon to launch and manage Compiz Fusion"
arch=('any')
url="http://opencompositing.org"
license=('GPL')
depends=('compiz-core-git' 'pygtk' 'compizconfig-python-git' \
         'hicolor-icon-theme' 'libtool' 'xorg-utils' 'mesa-demos')
makedepends=('git')
provides=('fusion-icon')
conflict=('fusion-icon')
install=fusion-icon.install
source=('decor-plugin.patch')
md5sums=('76ac5bb86edb1488211581c9305706fb')


_gitroot="git://anongit.opencompositing.org/users/crdlb/fusion-icon"
_gitname="fusion-icon"

build() {
  msg "Connecting to opencompositing.org GIT server...."
 
  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git-pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done"
  msg "Starting make..."

  # Remove old -build
  rm -rf $srcdir/$_gitname-build

  cp -r $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build

  # Use decor plugin
  patch -Np1 -i "$srcdir/decor-plugin.patch"

  # python2 fix
  sed -i 's_@python_@python2_' Makefile
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  make PREFIX=/usr DESTDIR=$pkgdir install

  cd $srcdir
  rm -rf $_gitname-build
}
