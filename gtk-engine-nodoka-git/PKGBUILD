# Contributor: zhuqin <zhuqin83@gmail.com>

pkgname=gtk-engine-nodoka-git
pkgver=20091009
pkgrel=1
pkgdesc="Nodoka gtk engine, git version"
url="https://fedorahosted.org/nodoka"
license="GPL"
arch=('i686' 'x86_64')
depends=('gtk2')
makedepends=('git')
provides=('gtk-engine-nodoka')
options=('!libtool')

_gitroot="git://git.fedorahosted.org/nodoka"
_gitname="gtk-engine-nodoka"

build() {
  cd $srcdir
  msg "Connecting to the GIT server...."
  
  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi
  
  msg "GIT checkout done"
  msg "Starting make..."
  
  git clone $srcdir/$_gitname $srcdir/$_gitname-build
  
  cd $srcdir/$_gitname-build/gtk-nodoka-engine
  mkdir m4
  
  autoreconf -isvf || return 1
  ./configure --prefix=/usr --enable-animation || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
  
  rm -rf $srcdir/$_gitname-build
}
