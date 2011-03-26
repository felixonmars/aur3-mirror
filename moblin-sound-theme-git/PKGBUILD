# Maintainer: Alex Anthony <alex.anthony28991@googlemail.com>

pkgname=moblin-sound-theme-git
_pkgname=moblin-sound-theme
pkgver=20090809
pkgrel=1
pkgdesc="The Moblin default sound theme"
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

   cd $_gitname-build || return 1
  intltoolize --copy --force --automake || return 1
  autoreconf -v -i || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
