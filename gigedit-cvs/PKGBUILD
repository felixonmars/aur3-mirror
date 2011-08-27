# Contributor: svoufff <svoufff at gmail dot com>

pkgname=gigedit-cvs
pkgver=20090709
pkgrel=1
pkgdesc="An instrument editor for gigasampler files"
arch=('i686' 'x86_64')
options=('')
url="http://www.linuxsampler.org/"
license=('GPL')
depends=('gtkmm' 'linuxsampler')
makedepends=('cvs' 'intltool' 'docbook-xsl' 'libtool')
conflicts=('gigedit')
provides=('gigedit')
source=()
md5sums=()

_cvsroot=":pserver:anonymous@cvs.linuxsampler.org:/var/cvs/linuxsampler"
_cvsmod="gigedit"

build() {

cd $srcdir/

msg "Connecting to cvs.linuxsampler.org"

if [ -d $_cvsmod/CVS ]; then
  cd $_cvsmod
  cvs update -d -P
else
  cvs -z3 -d$_cvsroot co $_cvsmod
  cd $_cvsmod
fi

msg "CVS checkout done or server timeout"
msg "Starting make..."

cp -r ../$_cvsmod ../$_cvsmod-build
cd $srcdir/$_cvsmod-build

make -f Makefile.cvs || return 1
./configure --prefix=/usr || return 1
make || return 1
make DESTDIR=$pkgdir install || return 1

rm -rf $srcdir/$_cvsmod-build
}

