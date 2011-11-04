# Maintainer: Kiodo1981 <cristianmartina1981@gmail.com>
# Contributor: td123 <gostrc@gmail.com>

pkgname=warmux-svn
pkgver=10277
pkgrel=1
pkgdesc='Wormux is a clone of the worms game.'
url='http://www.wormux.org/'
arch=('i686' 'x86_64')
license='GPL'
conflicts=('wormux' 'warmux' 'warmux-data' 'warmux-bonusmaps')
provides=('wormux')
depends=('libxml++2' 'sdl_image' 'sdl_gfx' 'sdl_ttf' 'sdl_mixer' 'sdl_net' 'curl')
makedepends=('subversion')

_svntrunk='http://svn.gna.org/svn/warmux/trunk'
_svnmod='warmux'

build() {
  msg 'Getting sources...'

  if [ -d ${_svnmod} ]; then
    cd ${_svnmod}
    svn up -r ${pkgver}
  else
    svn co ${_svntrunk} ${_svnmod} -r ${pkgver}
  fi

  msg 'SVN checkout done or server timeout'
  msg 'Starting make...'

  cd ${srcdir}

  rm -rf build
  cp -r ${_svnmod} build
  cd build

  ./autogen.sh

  ./configure \
    --prefix=/usr

  make
}

package() {
  cd build

  make DESTDIR=${pkgdir} install
}
