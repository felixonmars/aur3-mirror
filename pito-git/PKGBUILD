pkgname=pito-git
pkgver=20100923
pkgrel=1
pkgdesc="An system call interceptor creation utility library and environment."
arch=('i686' 'x86_64')
url="http://chilon.net/pito"
license=('MPL' 'GPL' 'LGPL')
depends=('bash' 'boost>=1.39')
makedepends=('git' 'cmake>=2.6')
provides=(pito)
# install=conkeror.install
# source=(http://ftp.eenet.ee/gentoo-portage/www-client/conkeror/files/conkeror.desktop)
# md5sums=('480131d88397ede9d92bf27e96d2d84a')

_gitroot="git://gitorious.org/pito/pito.git"
_gitname="pito"

build() {
  cd $srcdir

 ## Git checkout
  if [ -d $srcdir/${_gitname} ] ; then
    msg "Git checkout:  Updating existing tree"
    cd ${_gitname} && git pull origin  || return 1
    msg "Git checkout:  Tree has been updated"
  else
    msg "Git checkout:  Retrieving sources"
    git clone ${_gitroot}  || return 1
  fi
  msg "Checkout completed"

 ## Build
  rm -rf $srcdir/${_gitname}-build
  cp -r $srcdir/${_gitname} $srcdir/${_gitname}-build  || return 1
  cd $srcdir/${_gitname}-build
  cd src/pito && ./configure --prefix=/usr && make || return 1
}

package() { 
  cd $srcdir/${_gitname}-build/src/pito
  make install DESTDIR=$pkgdir
} 
