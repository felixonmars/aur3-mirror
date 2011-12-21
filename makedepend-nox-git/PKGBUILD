# Contributor: Andreas Baumann <abaumann at yahoo dot com>
pkgname=makedepend-nox-git
pkgver=20111221
pkgrel=1
pkgdesc="The X.org dependency generator (without X11 dependencies)"
license=('X11')
arch=('i686' 'x86_64')
url="http://freedesktop.org"
depends=()
makedepends=('git')
provides=('makedepend')
md5sums=('8f74d2dcf94db2470ed096127941893d')
_gitroot=git://git.freedesktop.org/git/xorg/util/makedepend
_gitname=makedepend
source=(nox.patch makedepend-automake-man-substs.patch)

build() {
  cd $startdir/src
  
  msg "Getting source from git..."
  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git pull origin
  else
    git clone $_gitroot
  fi

  cp -r $startdir/src/$_gitname $startdir/src/$_gitname-build
  cd $startdir/src/$_gitname-build

  msg "Patching..."
  for i in $startdir/*.patch; do
    patch -Np1 -i "$i" || return 1
  done

  msg "Running autogen..."
  ./autogen.sh || return 1
  
  msg "Building..."
  make || return 1
  mkdir -p $startdir/pkg/usr/bin
  cp makedepend $startdir/pkg/usr/bin/
  mkdir -p $startdir/pkg/usr/man/man1
  cp makedepend.man $startdir/pkg/usr/man/man1/makedepend.1
  gzip $startdir/pkg/usr/man/man1/makedepend.1

  msg "Cleaning up..."
  rm -rf $startdir/src/$_gitname-build
}
md5sums=('f55d9990f25165be42ba54c160b490d6'
         'e0c8ab098437d7d3ccfdd0ed7c54600c')
