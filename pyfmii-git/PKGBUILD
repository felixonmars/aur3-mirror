# Contributor: Procyon <procyon.hidden@gmail.com>

pkgname=pyfmii-git
pkgver=20090331
pkgrel=1
pkgdesc="Nine panel file manager in the style of wmii/mc"
url="http://github.com/Procyon2/pyfmii/tree/master"
license="none"
arch=('i686' 'x86_64')
makedepends=('git')
depends=('python')
_gitroot='git://github.com/Procyon2/pyfmii.git'
_gitname='pyfmii'
source=()
md5sums=()

build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi
  msg "GIT checkout done or server timeout"

  install -D -m755 $startdir/src/pyfmii/pyfmii $startdir/pkg/usr/bin/pyfmii
  install -D -m644 $startdir/src/pyfmii/README $startdir/pkg/usr/share/pyfmii/README
  install -D -m644 $startdir/src/pyfmii/README-rcfile $startdir/pkg/usr/share/pyfmii/README-rcfile
}
