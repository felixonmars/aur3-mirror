# Mantainer Jens Staal <staal1978@gmail.com>

pkgname=netbsd-rump-cvs
pkgver=20130527
pkgrel=1
pkgdesc="The NetBSD Rump kernel"
arch=('i686' 'x86_64')
url="http://www.netbsd.org/docs/rump/"
license=('BSD')
#depends=('')
makedepends=('cvs' 'git')
provides=('rump' 'netbsd-rump')

_gitroot=('https://github.com/anttikantee/buildrump.sh')
_gitname=('buildrump-scripts')


build() {
  msg "getting the latest buildrump scripts"
  
  cd "$srcdir"
  if [ -d $_gitname ] ; then
    cd $_gitname && git pull $_gitroot
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "updating cvs checkout"
  
  cd ${srcdir}/${_gitname}
  ./buildrump.sh checkout
  
  msg "Set up build directory to mantain pristine cvs"
  rm -rf "$srcdir/build"
  mkdir -p $srcdir/build
  
  msg "Move latest build script into build directory"
  cp -r $srcdir/$_gitname/* $srcdir/build

}

package() {

  #no namespace conficts with systems packages, so we install stuff at the standard locations
  cd $srcdir/build
  
  ./buildrump.sh -r -d $pkgdir/usr tools build install

  mkdir -p $pkgdir/usr/share/licenses/rump/
  cp $srcdir/build/LICENSE $pkgdir/usr/share/licenses/rump/
}
