pkgname=dockmanager-kde-git
_realname=dockmanager-kde
pkgver=20131029
pkgrel=1
pkgdesc="Dockmanager scripts for KDE"
arch=('i686' 'x86_64')
url="http://quickgit.kde.org/?p=scratch%2Fcedric%2Fdockmanager-kde.git&a=shortlog"
license=('GPL')
depends=('python2-gobject')
install="$pkgname.install"
sha1sums='4726c3151432d06a6cf763b79353565e505dc682'
_gitroot="git://anongit.kde.org/scratch/cedric/${_realname}"
_gitname=${_realname}
 
build() {
  cd ${srcdir}

  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ]; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
  fi
}

package() {
  cd "$srcdir/$_realname"
  mkdir -p $pkgdir/usr/share/dockmanager
  cp -ax * $pkgdir/usr/share/dockmanager
  find $pkgdir -type f -exec sed -i '1s|#!/usr/bin/env python$|&2|' {} +
}
