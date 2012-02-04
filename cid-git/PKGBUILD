# Maintainer: Wido <widomaker2k7 at gmail dot com>

pkgname=cid-git
_pkgname=Conky-Images-Display
pkgver=20110603
pkgrel=1
pkgdesc="Conky Images Display (GIT version)"
arch=('i686' 'x86_64')
url="http://cid.ziirish.info/"
license=('GPL2')
depends=('curl' 'dbus-glib' 'gtk2' 'libxml2')
provides=('cid')
makedepends=('git' 'cmake')
source=()
md5sums=()

_gitroot="git://github.com/ziirish/$_pkgname.git"
_gitname="cid"

build() {

cd $srcdir

if [ -d $srcdir/${_pkgname} ] ; then
    msg "Git checkout:  Updating existing tree"
    cd ${_pkgname} && git pull origin
    msg "Git checkout:  Tree has been updated"
  else
    msg "Git checkout:  Retrieving sources"
    git clone ${_gitroot}  
  fi
  msg "Checkout completed"

  rm -rf $srcdir/${_pkgname}-build
  cp -r $srcdir/${_pkgname} $srcdir/${_pkgname}-build

    # Compile cid
    cd $srcdir/${_pkgname}-build
    mkdir build
    cd build
    cmake -DHAVE_COMPIZ="1" -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package()
{
    # Install cid
    cd $srcdir/${_pkgname}-build/build
    make DESTDIR="$pkgdir/" install
}
