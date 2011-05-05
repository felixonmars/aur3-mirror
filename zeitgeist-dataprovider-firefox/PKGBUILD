#Contributor: twa022 <twa022 at gmail dot com>

pkgname=zeitgeist-dataprovider-firefox
pkgdesc="Zeitgeist dataprovider for firefox"
pkgver=137
pkgrel=1
arch=('i386' 'x86_64')
url="https://launchpad.net/zeitgeist-dataproviders"
license=('GPL3')
depends=('libzeitgeist' 'firefox>=4.0')
makedepends=('bzr' 'xulrunner')

_bzrmod=zeitgeist-dataproviders
_bzrtrunk=http://bazaar.launchpad.net/~zeitgeist-dataproviders/zeitgeist-dataproviders/trunk

build() {
  cd $startdir/src
  msg "Connecting to the server...."

  if [ -d ./$_bzrmod ]; then
    cd ./$_bzrmod && bzr up && cd ..
  else
    bzr co --lightweight $_bzrtrunk $_bzrmod
  fi
  
  cp -r $_bzrmod $_bzrmod-build
  cd $_bzrmod-build
  
  ./autogen.sh --prefix=/usr
  cd firefox-40-libzg
  make
  make DESTDIR=$pkgdir install
} 
