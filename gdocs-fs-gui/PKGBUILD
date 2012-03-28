# Contributor: Ninja-1

pkgname=gdocs-fs-gui
pkgver=20120328
pkgrel=1
pkgdesc="Google Docs FS GUI"
arch=('i686' 'x86_64')
url="http://millertechnologies.net"
license=('GPL')
depends=('python-pexpect' 'wxpython' 'python2' 'google-docs-fs')
makedepends=('git')
md5sums=()

_gitroot="git://github.com/Ninja-1/gdocs-fs-gui.git"
_gitname="gdocs-fs-gui"

build() {
  msg "Connecting to github..."
 
  if [[ -d $startdir/src/$_gitname ]] ; then
    cd $_gitname
    git pull origin || return 1
    msg "The local files are updated."
  else
    git clone $_gitroot || return 1
  fi

  msg "GIT checkout done"
  msg "Starting make..."

  # Remove old -build
  rm -rf $startdir/src/$_gitname-build

  cp -r $startdir/src/$_gitname $startdir/src/$_gitname-build
  cd $startdir/src/$_gitname-build

  cd $startdir/src
  rm -rf $_gitname-build

  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/applications

  cp $startdir/src/$_gitname/gui.py $pkgdir/usr/bin
  cp $startdir/src/$_gitname/gdocs.desktop $pkgdir/usr/share/applications
  chmod 755 $pkgdir/usr/bin/gui.py

}