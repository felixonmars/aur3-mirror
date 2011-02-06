# Contributor: Corali Signs Co. <coralisigns[at]gmail(dot)com>
pkgname=libgpod-git-iphone
pkgver=20100515
pkgrel=1
pkgdesc="libgpod is a shared library to access the contents of an iPhone. Version with 
artwork patch."
arch=(i686 x86_64)
license=('LGPL')
depends=('gtk2>=2.10.14' 'libxml2' 'sg3_utils')
makedepends=('perlxml' 'swig' 'git' 'intltool' 'gtk-doc')
url="http://gitorious.org/~teuf/libgpod/teuf-sandbox/commits/iphone"
options=(!libtool)
source=('artwork.patch')
conflicts=('libgpod' 'libgpod-git')
provides=('libgpod=0.7.9' 'libgpod-git' 'libgpod-git-iphone')
md5sums=('b098b1a0be4c4aef4be04e0eebdb8ea0')

_gitroot=git://gitorious.org/~teuf/libgpod/teuf-sandbox.git
_gitname=teuf-sandbox

build() {
    cd $startdir/src
  
    msg "Connecting to libgpod GIT server...."
    
    if [ -d $startdir/src/$_gitname ] ; then
        cd $_gitname && git pull
        msg "The local files are updated."
    else
        git clone -b iphone $_gitroot
        cd $_gitname
    fi
  patch -Np1 -i ../artwork.patch || return 1
  ./autogen.sh 
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
