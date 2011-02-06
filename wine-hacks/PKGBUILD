# Contributor: R. Schmidt <spamdispatch-aur@yahoo.de>

pkgname=wine-hacks
pkgver=20080907
pkgrel=1
pkgdesc="Wine fork with patches not (yet) suitable for mainline"
url="http://repo.or.cz/r/wine/hacks.git"
arch=('i686')
license=('LGPL')
depends=('libgphoto2' 'freetype2' 'fontconfig' 'libungif' 'alsa-lib' 'glut' 'libldap' 'libxslt' 'lcms' 'libxxf86dga' 'freeglut' \
         'libxinerama' 'libxcursor' 'libxrandr' 'libxrender' 'libxdamage' 'xorg-apps' 'mesa')
makedepends=('git' 'sane' 'fontforge' 'flex' 'bison')
provides=(wine)
conflicts=(wine)
source=()
md5sums=()

_gitroot="git://repo.or.cz/wine/hacks.git"
_gitname="hacks"

build() {
  cd $startdir/src/

  msg "Connecting to GIT server...."
  if [ -d $startdir/src/$_gitname ] ; then
  cd $_gitname && git-pull origin
  msg "The local files are updated."
  else
  git clone $_gitroot
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting make..."
  cp -r $startdir/src/$_gitname $startdir/src/$_gitname-build
  cd $startdir/src/$_gitname-build

  ./configure --prefix=/usr --sysconfdir=/etc --enable-opengl --with-x
  make depend || return 1
  make || return 1
  make prefix=$startdir/pkg/usr install || return 1
  mkdir -p $startdir/pkg/etc/wine
  rm -rf $startdir/src/$_gitname-build
}
