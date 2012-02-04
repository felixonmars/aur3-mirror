# Contributor: cghislai <charlyghislain@gmail.com>

pkgname=sdl_ttf-svn
pkgver=4463
pkgrel=1
pkgdesc="A library that allows you to use TrueType fonts in your SDL applications"
arch=('i686' 'x86_64')
url="http://www.libsdl.org/projects/SDL_ttf/"
license=('LGPL')
depends=('sdl>=1.2.99' 'freetype2')
conflicts=('sdl_ttf')
provides=('sdl_ttf=2.0.99')
options=('!libtool')
source=()
md5sums=()

_svntrunk=http://svn.libsdl.org/trunk/SDL_ttf
_svnmod=SDL_ttf

build() {
	cd ${srcdir}
	if [ -d $_svnmod/.svn ]; then
	  (cd $_svnmod && svn up -r $pkgver)
	else
	  svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi
        msg "SVN checkout done or server timeout"
        msg "Starting make..."
	cd ${srcdir}/$_svnmod
	
  sh autogen.sh
  ./configure --prefix=/usr --disable-nasm --enable-alsa --enable-esd --with-x --disable-rpath
  make || return 1
  make DESTDIR=${pkgdir} install

  rm -rf ${srcdir}/$_svnmod-build
}
