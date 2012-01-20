# Maintainer: sanderd17 <sanderd17[AT]gmail[DOT]com>
# Author: sanderd17 <sanderd17[AT]gmail[DOT]com>

pkgname=gnome-shell-extension-package-installer-git
pkgver=20120120
pkgrel=1
pkgdesc="Install packages directly from the Gnome-Shell overview."
arch=(i686 x86_64)
url="https://gitorious.org/gnome-shell-extension-application-installer"
license=('LGPL')
depends=('packer' 'package-query' 'gnome-shell>=3.2')
makedepends=('git')
provides=()
conflicts=()
optdepends=()
replaces=()
options=()
source=()
md5sums=()

_gitroot="git://git.gitorious.org/gnome-shell-extension-application-installer/gnome-shell-extension-application-installer.git"
_gitname="gnome-shell-extension-application-installer.git"


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

  mkdir -p ${pkgdir}/usr/share/gnome-shell/extensions/installer@sanderd17.gmail.com

  mv ${srcdir}/${_gitname}-build/* ${pkgdir}/usr/share/gnome-shell/extensions/installer@sanderd17.gmail.com

}


