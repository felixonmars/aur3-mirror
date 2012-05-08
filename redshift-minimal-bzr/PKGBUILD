# Maintainer: OK100 <ok100.ok100.ok100@gmail.com>

pkgname=redshift-minimal-bzr
pkgver=178
pkgrel=1
pkgdesc="Adjusts the color temperature of your screen according to your surroundings, with minimal dependencies."
url='http://jonls.dk/redshift/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('libxxf86vm')
makedepends=('bzr' 'python2')
conflicts=('redshift')
provides=('redshift')

_bzrtrunk=lp:redshift
_bzrmod=redshift

build() {
  cd $srcdir

  msg "Connecting to bzr server...."

  if [ -d $_bzrmod ] ; then
    cd $_bzrmod && bzr pull -r $pkgver
    msg "The local files are updated."
  else
    bzr branch $_bzrtrunk $_bzrmod -r $pkgver
  fi

  msg "bzr checkout done or server timeout"
  msg "Starting make..."

  rm -rf $srcdir/$_bzrmod-build
  cp -r $srcdir/$_bzrmod $srcdir/$_bzrmod-build
  cd $srcdir/$_bzrmod-build

  sed -i 's/python/python2/' src/gtk-redshift/gtk-redshift

  autoreconf -v --install
  PYTHON=/usr/bin/python2 ./configure --disable-gui --disable-gnome-clock --prefix=/usr
  make
}

package() {
  cd $srcdir/$_bzrmod-build
  make DESTDIR="$pkgdir" install
}
