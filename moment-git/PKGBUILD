__pkgname=moment
pkgname=${__pkgname}-git
pkgver=20111125
pkgrel=1
url="http://momentvideo.org/"
pkgdesc="Moment Video Server lets you organize live video streaming on the Internet with ease."
arch=('i686' 'x86_64')
license=('GPL')
depends=('libmary-git' 'mconfig-git' 'ctemplate')

__gitroot="git://github.com/erdizz/moment.git"
__gitname="moment"

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
