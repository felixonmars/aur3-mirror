# Maintainer: Alex Anthony <alex.anthony28991@googlemail.com>

pkgname=moblin-cursor-theme-git
_pkgname=moblin-cursor-theme
pkgver=20091014
pkgrel=1
pkgdesc="The Moblin default cursor theme"
arch=('i686' 'x86_64')
url="http://www.moblin.org"
license=('GPL')
depends=()
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
_gitroot=git://git.moblin.org/${_pkgname}
_gitname=${_pkgname}
groups=('moblin-git')
source=('no-version.patch')
md5sums=('485038ac07bdd49379b52feeea8c760c')

build() {
  cd $startdir/src
  msg "Connecting to moblin.org git server...."
  rm  -rf $startdir/src/$_gitname-build

  if [[ -d $_gitname ]]; then
   cd $_gitname || return 1
   git pull origin || return 1
    else
   git clone $_gitroot $_gitname || return 1
     fi
  msg " checkout done."
  cd $srcdir || return 1
  cp -r $_gitname $_gitname-build
  patch -p0 < $srcdir/no-version.patch
  cd $_gitname-build || return 1
  make dist || return 1
  tar -xvf $_pkgname.tar.bz2 || return 1
  mkdir -p $startdir/pkg/usr/share/icons/
  cp -r $_pkgname $startdir/pkg/usr/share/icons/
  chmod -R 777 $startdir/pkg/usr/share/icons/$_pkgname
  chown -R root:users $startdir/pkg/usr/share/icons/$_pkgname
  mv $pkgdir/usr/share/icons/$_pkgname/xcursors $pkgdir/usr/share/icons/$_pkgname/cursors
  cp $srcdir/$_gitname-build/index.theme $pkgdir/usr/share/icons/$_pkgname
}
