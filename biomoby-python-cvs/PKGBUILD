# Contributor: Ricardo Honorato <rikardo.horo@gmail.com>
# Contributor: Thomas Dziedzic

pkgname=biomoby-python-cvs
pkgver=20100303
pkgrel=1
pkgdesc='Python implementation of the bioMOBY API.'
arch=('i686' 'x86_64')
url='http://cvs.open-bio.org/cgi-bin/viewcvs/viewcvs.cgi/Python/?cvsroot=moby-live'
license=('GPL')
depends=('python-soappy')

_cvsroot=':pserver:cvs@cvs.open-bio.org:/home/repository/moby'
_cvsmod='moby-live'

build() {
  echo "I'll try to connect to the open-bio.org cvs (cvs.open-bio.org). The password is 'cvs'."
  cvs -d "$_cvsroot" login
  cvs -d "$_cvsroot" co -P "$_cvsmod"
  
  mkdir -p "$pkgdir/usr"
  cd moby-live/Python/packages
  
  # Install PyIPC... is a prerequisite
  tar xf PyIPC.tar.bz2
  cd PyIPC
  python setup.py install --prefix "$pkgdir/usr"

  # Install ZSI
  cd ..
  tar xf ZSI-1.5.0-patched-2.tar.bz2
  cd ZSI-1.5.0-patched-2
  python setup.py install --prefix "$pkgdir/usr"

  # Finally install the bioMoby-python package
  cd ../..
  python setup.py build
  python setup.py install --prefix "$pkgdir/usr"
}
