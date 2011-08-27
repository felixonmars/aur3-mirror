pkgname=egear-svn
pkgver=40
pkgrel=1
pkgdesc="eGear, a download tool written in QT4"
url="http://egear.googlecode.com"
arch=(i686 x86_64)
license=('GPL')
depends=('qt' 'curl' 'openssl') 
makedepends=()
groups=()
options=('!libtool')
#install=$pkgname.install
source=()
md5sums=()

_svnmod="egear"
_svntrunk="http://egear.googlecode.com/svn/trunk/"

build() {
  cd ${startdir}/src/
  
  msg "Getting sources..."
  svn co $_svntrunk $_svnmod -r $pkgver
  
  msg "Creating build dir..."
  cp -r $_svnmod $_svnmod-build

  msg "Starting build..."
  cd $_svnmod-build
  qmake || return 1
  make || return 1
  #make DESTDIR=${startdir}/pkg install || return 1
  
  mkdir -p $pkgdir/usr/{bin,share/applications,share/pixmaps}
  install -Dm755 egear $pkgdir/usr/bin/
  install -Dm644 misc/egear.desktop $pkgdir/usr/share/applications/
  install -Dm644 res/egear.png $pkgdir/usr/share/pixmaps/
}
