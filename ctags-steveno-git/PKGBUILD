pkgname=ctags-steveno-git
pkgver=20120201
pkgrel=1
pkgdesc="Clone of official ctags repo with falcon, obj-c and css patches added"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
url="http://ctags.sourceforge.net/"
conflicts=('ctags')
provides=('ctags')

_gitname=ctags
_gitroot=git://github.com/steveno/ctags.git

build() {
  
  cd "$srcdir"

  msg "Connecting to GIT server...."
  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi
  msg "GIT checkout done or server timeout"

  cd $srcdir/$_gitname

  ./configure --prefix=/usr \
              --disable-external-sort
  make
}

package() {
  cd ${srcdir}/$_gitname

  make prefix=${pkgdir}/usr install
}
