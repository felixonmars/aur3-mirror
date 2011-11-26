__pkgname=mycpp
pkgname=${__pkgname}-git
pkgver=20111125
pkgrel=1
pkgdesc="MyNC C++ helper library"
arch=('i686' 'x86_64')
license=('GPL')
provides=(${__pkgname}=1.0)
url="http://momentvideo.org/developers.html"

__gitroot="git://github.com/erdizz/${__pkgname}.git"
__gitname="${__pkgname}"

build() {
	  cd $srcdir

 ## Git checkout
  if [ -d $srcdir/${__gitname} ] ; then
    msg "Git checkout:  Updating existing tree"
    cd ${__gitname} && git checkout ${_commit}
    msg "Git checkout:  Tree has been updated"
  else
    msg "Git checkout:  Retrieving sources"
    git clone ${__gitroot} && cd ${__gitname} && git checkout ${_commit} 
  fi
  msg "Checkout completed"
  
  [ -d ${__gitname}-build ] || rm -rf $srcdir/${__gitname}-build
  git clone $srcdir/${__gitname} $srcdir/${__gitname}-build
  cd $srcdir/${__gitname}-build
	./autogen.sh
	./configure --prefix=/usr
	make
	}

package() {
	cd "$srcdir"/${__gitname}-build
	make prefix="$pkgdir"/usr install
	}
