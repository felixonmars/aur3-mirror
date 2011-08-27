# Contributor: Maciej Ciemborowicz <moonkey@op.pl>
pkgname=liblscp-cvs
pkgver=20081122
pkgrel=1
pkgdesc="LinuxSampler Control Protocol (LSCP) wrapper library"
arch=('i686' 'x86_64')
options=('')
url="http://www.linuxsampler.org/"
license=('GPL')
depends=('glibc' 'libtool')
makedepends=('cvs')
conflicts=('liblscp')
provides=('liblscp')
source=()
md5sums=()

_cvsroot=":pserver:anonymous@cvs.linuxsampler.org:/var/cvs/linuxsampler"
_cvsmod="liblscp"

build() {

cd $srcdir/

msg "Connecting to cvs.linuxsampler.org"

cvs -z3 -d$_cvsroot \
  co $_cvsmod
cd $_cvsmod

msg "CVS checkout done or server timeout"
msg "Starting make..."

cp -r ../$_cvsmod ../$_cvsmod-build
cd $srcdir/$_cvsmod-build

make -f Makefile.cvs
./configure --prefix=/usr || return 1
make || return 1
make DESTDIR=$pkgdir install || return 1

rm -rf $srcdir/$_cvsmod-build

}

