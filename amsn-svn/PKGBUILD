# Maintainer: Dimitri Pascual <quetzal@khetzal.info>

pkgname=amsn-svn
pkgver=12417
pkgrel=1
pkgdesc="MSN client written in Tcl/Tk"
arch=('i686' 'x86_64')
url="http://amsn.sourceforge.net/"
license=('GPL2')
depends=('tk' 'tls' 'tcl')
makedepends=('libjpeg' 'libpng' 'farstream' 'libv4l' 'subversion')
optdepends=('farstream: for video conferencing')
provides=('amsn')
conflicts=('amsn')
source=()
md5sums=()

_svnmod="amsn"
_svntrunk="https://amsn.svn.sourceforge.net/svnroot/amsn/trunk/amsn"

build() {

cd ${srcdir}

msg "Connecting to SVN server...."

if [ -d ${_svnmod}/.svn ]; then
(cd ${_svnmod} && svn up -r $pkgver)
else
svn co ${_svntrunk} --config-dir ./ -r $pkgver ${_svnmod}
fi

msg "SVN checkout done or server timeout"
msg "Starting make..."

svn export ${_svnmod} ${_svnmod}-build
cd ${_svnmod}-build
sed -i 's|utils/ca-certificates.crt|ca-certs/ca-certificates.crt|' Makefile.in

./configure --prefix=/usr
make || return 1
make DESTDIR=$pkgdir install

rm -rf ${srcdir}/${_svnmod}-build
}
