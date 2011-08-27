# Contributor: Maciej Ciemborowicz <moonkey@op.pl>
pkgname=libgig-cvs
pkgver=20081107
pkgrel=2
pkgdesc="Gigasampler file loader library"
arch=('i686' 'x86_64')
options=('')
url="http://www.linuxsampler.org/"
license=('GPL')
depends=('gcc' 'libsndfile>=1.0.2' 'libtool')
makedepends=('cvs' 'automake>=1.5' 'autoconf')
conflicts=('libgig')
provides=('libgig')
source=()
md5sums=()

_cvsroot=":pserver:anonymous@cvs.linuxsampler.org:/var/cvs/linuxsampler"
_cvsmod="libgig"

build() {

cd $srcdir/

msg "Connecting to cvs.linuxsampler.org"

cvs -z3 -d$_cvsroot \
  co $_cvsmod
cd $_cvsmod

msg "CVS checkout done or server timeout"
msg "Starting make..."

export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig

cp -r ../$_cvsmod ../$_cvsmod-build
cd $srcdir/$_cvsmod-build

make -f Makefile.cvs
./configure --prefix=/usr || return 1
make || return 1
make DESTDIR=$pkgdir install || return 1

rm -rf $srcdir/$_cvsmod-build

}

