# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Josh Taylor (deficite) <joshtaylor.mail@gmail.com>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
# Contributor: Vladimir <vooon341@gmail.com>
pkgname=ogre-branch-1.4
pkgver=1.4.9
pkgrel=4
pkgdesc="A scene-oriented, flexible 3D engine written in C++"
arch=('i686' 'x86_64')
url="http://www.ogre3d.org"
license=('LGPL')
depends=('freetype2' 'zziplib' 'freeimage' 'nvidia-cg-toolkit' 'cegui' 'ois' 'libtool' 'libxaw' 'libxrandr')
conflicts=('ogre')
provides=('ogre=1.4.9')
source=("http://downloads.sourceforge.net/sourceforge/ogre/ogre-v${pkgver//./-}.tar.bz2" \
	"bootstrap.patch")
   
md5sums=('8a73fbcf42fd6b156b2567839d0cd125'
         'fd725f75c0480cde4879802ec6f84ee7')

build() {
  cd ${srcdir}/ogre

  # patch this old piece of crap
  patch < ${srcdir}/bootstrap.patch && ./bootstrap
  # --with-platform=GLX is for nVidia users. I am separating the ogre package from its demos,
  # if I can figure out a good way to do so. If you want the demos, remove the disable flag for now
  ./configure --prefix=/usr --with-platform=GLX --disable-ogre-demos

  [ "$CARCH" = "x86_64" ] && \
  sed -i s,"CFLAGS = -march","CFLAGS = -fpic -fvisibility=default -march",g Makefile && \
  sed -i s,"CXXFLAGS = ","CXXLAGS = -fpic -fivisibility=default ",g Makefile
  
  make
}

package() {
  cd ${srcdir}/ogre

  make DESTDIR=${pkgdir} install
}

