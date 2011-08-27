# Contributor: Yngve I. Levinsen <yngve.inntjore.levinsen@cern.ch>

pkgname=kdelicious-git
pkgver=20090409
pkgrel=1
pkgdesc="Del.icio.us plugin for Konqueror KDE4."
depends=('kdelibs' )
makedepends=('git' 'cmake' 'automoc4')
url=('http://github.com/greghaynes/kdelicious')
license="GPL"
arch=('i686' 'x86_64')
 
_gitroot=git://github.com/greghaynes/kdelicious.git
_gitname=kdelicious
 
build() 

{

 cd ${srcdir}

    if [ -d $startdir/src/$_gitname ] ; then
        cd $_gitname && git-pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot
        cd $_gitname
    fi
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd ${srcdir}/${_gitname} || return 1
 
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE
 
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
 

}
