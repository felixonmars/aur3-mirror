# Maintainer Alfredo Palhares <masterkorp@masterkorp.net> 

pkgname=megatunix-git
pkgver=20120402
pkgrel=1
pkgdesc="MegaTunix Tuning software"
arch=('i686' 'x86_64')
url="http://megatunix.sourceforge.net/"
license=('GPL')
depends=('gtkglext' 'libglade' )
makedepends=('intltool'  'git')
optdepends=('gdb')
conflicts=('megatunix')
provides=('megatunix')

_gitroot="http://github.com/djandruczyk/MegaTunix.git"
_gitname="megatunix"
_gitrevision="4cdb8677cf84a2c7004c1405a459a450fd1d247c"

checkout() {
  msg "Using predefined commit"
  git checkout $_gitrevision
  msg "Commits behing HEAD" git log --pretty=oneline $_gitrevision..HEAD | wc -l
}

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d "$_gitname" ] ; then
    cd $_gitname && git pull && cd ..
  else
    git clone $_gitroot $_gitname
  fi

  if [ -d "$_gitname-build" ]; then
    rm -rf $_gitname-build
  fi
  cp -r $_gitname $_gitname-build
  cd $_gitname-build
  checkout

  msg "Starting make..."
  ./autogen.sh --disable-dependency-tracking \
  --prefix=/usr \
  --bindir=/usr/bin \
  --libdir=/usr/lib \
  --sysconfdir=/etc

  make 
}

package() {
  cd $srcdir/$_gitname-build
  make DESTDIR=${pkgdir} install 
}
