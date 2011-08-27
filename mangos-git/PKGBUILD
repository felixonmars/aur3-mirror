# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=mangos-git
pkgver=20090219
pkgrel=1
pkgdesc=""
arch=('x86_64')
url="http://getmangos.com/community"
license=('GPL')
depends=('mysql' 'openssl' 'libmysqlclient')
makedepends=('subversion' 'git')
options=('libtool')
source=()
md5sums=()
#generate with 'makepkg -g'

_gitroot="git://github.com/mangos/mangos.git"
_gitname="mangos"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build process ..."

  rm -rf "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname"
  [ -d src/bindings/ScriptDev2 ] || mkdir src/bindings/ScriptDev2 || return 1
  svn co https://scriptdev2.svn.sourceforge.net/svnroot/scriptdev2/ \
    src/bindings/ScriptDev2 || return 1
 # git apply src/bindings/ScriptDev2/patches/MaNGOS-2008-12-22-ScriptDev2.patch || return 1

  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  autoreconf --install --force || return 1
  aclocal || return 1
  autoheader || return 1
  autoconf || return 1
  automake --add-missing || return 1
  automake src/bindings/ScriptDev2/Makefile || return 1

  [ -d objdir ] || mkdir objdir
  cd objdir
  ../configure --prefix=/usr --sysconfdir=/etc/ --enable-cli \
    --enable-ra --datadir=/usr/share/mangos || return 1
  
  make || return 1
  make DESTDIR="$pkgdir/" install
} 
