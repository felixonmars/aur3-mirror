 
# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=goblin-git
pkgver=20110422
pkgrel=1
pkgdesc="A re-implementation of *NIX and 9base/plan9port utilities written in Go"
arch=('i686' 'x86_64')
url="http://repo.cat-v.org/goblin/"
license=('LPL' 'MIT')
makedepends=('git' 'go')
source=('config64.patch' 'touch64.patch')
md5sums=('71b4d01f103140a9bb7294fce2e14d45' '8427b1f7b7dad442cce819934fef92e0')

_gitroot=('git://github.com/jdparent/goblin.git')
_gitname=('goblin')

build() {
 cd $srcdir
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull $_gitroot
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..." 

 rm -rf $srcdir/build

 cp -ar "$srcdir/$_gitname" $srcdir/build

 if [ ${CARCH}=x86_64 ]
    then
      patch $srcdir/build/config.mk -i $srcdir/config64.patch
      patch $srcdir/build/touch/touch.go -i $srcdir/touch64.patch
   else
      return 1
 fi


 cd $srcdir/build

 make all
}

package() {
 cd $srcdir/build
 make DESTDIR=$pkgdir/opt/ PREFIX=goblin install

 install -Dm644 $srcdir/build/LICENSE $pkgdir/usr/share/licenses/goblin/LICENSE
}
