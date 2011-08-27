pkgname=vkfs-svn
pkgver=11
pkgrel=1
pkgdesc="FUSE filesystem for vk.com"                                                                                         
arch=('i686' 'x86_64')
url="http://vkfs.googlecode.com"
license=('GPL')
depends=('fuse' 'curlpp')
makedepends=()
optdepends=()
conflicts=()
provides=('vkfs')

_svntrunk="http://vkfs.googlecode.com/svn/trunk/"
_svnmod="vkfs"


build() {
msg "Downloading from ${_svntrunk} ..."
  cd ${srcdir}
  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up -r ${pkgver})
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi
msg2 "SVN checkout done or server timeout"

msg "Creating temporary build directory..."
  rm -Rf ${_svnmod}-build
  cp -r ${_svnmod} ${_svnmod}-build
  cd ${_svnmod}-build

msg "Building and installing..."  
  make
  install -Dm755 bin/vkfs ${pkgdir}/usr/bin/vkfs

msg "Removing build directory..."
  cd ${srcdir}
  rm -Rf ${_svnmod}-build
}
