pkgname=nmapsi4-svn
pkgver=470
pkgrel=1
pkgdesc="Qt-based Gui nmap interface. SVN version"
arch=('i686' 'x86_64')
url="http://nmapsi.sourceforge.net/"
license=('GPL2')
conflicts=('nmapsi4')
depends=('qt4' 'nmap')
makedepends=('cmake>=2.6')

_svnmod="nmapsi4"
_svntrunk="http://nmapsi4.googlecode.com/svn/trunk/"

 build() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi


  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r ./$_svnmod/ ./$_svnmod-build
  cd ./$_svnmod-build/$_svnmod/

# Run cmake script
  cd tools
  ./cmake_verbose_script.sh

  cd ../build  
# Change package location to /usr from /usr/local	
  sed -i 's_/usr/local_/usr_' ./cmake_install.cmake 

  make || return 1
  make DESTDIR=${pkgdir} install
# Change permissions to enable the excutables
  chmod 755 ${pkgdir}/usr/bin/*
}

# vim:set ts=2 sw=2 et: