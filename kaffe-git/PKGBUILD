# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=kaffe-git
pkgver=20110629
pkgrel=1
pkgdesc="A clean room re-implementation of Java - not officially Java"
arch=('i686' 'x86_64')
url="http://www.kaffe.org/"
license=('GPL')
depends=('classpath' 'zziplib')
provides=('java-runtime')
makedepends=('git' 'eclipse-ecj')
optdepdends=('')


_gitroot=('git://github.com/kaffe/kaffe.git')
_gitname=('kaffe')

build() {
 cd $srcdir

   if [ -d $_gitname ] ; then
    cd $_gitname && git pull $_gitroot
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi
  rm -rf $srcdir/build
  cp -ar $srcdir/$_gitname $srcdir/build
  cd $srcdir/build
  ./configure --prefix=/usr --with-classpath-prefix=/usr/lib/classpath --with-classpath-classes=/usr/share/classpath/glibj.zip
  make
}

package() {
 cd $srcdir/build
 make DESTDIR=$pkgdir install
 mkdir -p  $pkgdir/usr/share/licenses/$_gitname
 install -m644 $srcdir/$_gitname/LICENSE $pkgdir/usr/share/licenses/$_gitname/LICENSE
}
