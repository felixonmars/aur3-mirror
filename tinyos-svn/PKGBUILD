# Maintainer: András Bíró <bbandi86@gmail.com
pkgname=tinyos-svn
pkgver=2.x
pkgrel=1
pkgdesc="Small operating system for sensor motes, embedded devices"
arch=(i686 x86_64)
license=(GPL)
url="http://www.tinyos.net/"
provides=('tinyos')
options=(!libtool)
optdepends=('jdk: for building java tools for tinyos applications'
	    'jre: for using java tools'
	    'avr-libc-tinyos: to build for atmel based platforms'
	    'avrdude: to installing for atmel based platform (which is not supported by uisp, like iris)'
	    'binutils-msp430: to build for msp430 based platforms'
	    'gcc-msp430: to build for msp430 based platforms'
	    'msp430-libc: to build for msp430 based platforms')
_svnroot="http://tinyos-main.googlecode.com/svn/trunk/ "
_svnmod="tinyos-main-read-only"
		
source=(tinyos.profile)
md5sums=('8275b06a188620150fb08facc1c34bd2')

build() {
  cd ${srcdir}
  if [ -d $_svnmod/.svn ]; then
    cd $_svnmod
    svn update
  else
    svn checkout $_svnroot $_svnmod
    cd $_svnmod
  fi
  msg "SVN checkout/update done or server timeout"
  mv ${srcdir}/${_svnmod} ${srcdir}/tinyos-2.x
  mkdir ${pkgdir}/opt/
  cp -r ${srcdir}/* ${pkgdir}/opt/
#  chmod -R a+wX ${pkgdir}/opt/tinyos-2.x
  install -D -m755 ${srcdir}/tinyos.profile ${pkgdir}/etc/profile.d/tinyos.sh
}
