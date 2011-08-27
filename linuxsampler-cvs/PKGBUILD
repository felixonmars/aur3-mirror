# Maintainer: Arch Linux Pro Audio <dev@archaudio.org>
# Contributor: svoufff <svoufff at gmail dot com>
pkgname=linuxsampler-cvs
pkgver=20090724
pkgrel=1
pkgdesc="Audio sampler backend"
arch=('i686' 'x86_64')
options=('')
url="http://www.linuxsampler.org/"
license=('GPL' 'custom')
depends=('libgig-cvs' 'jack-audio-connection-kit' 'sqlite3')
makedepends=('cvs' 'bison' 'libtool')
options=('emptydirs')
optdepends=('qsampler: QT frontend to LinuxSampler')
conflicts=('linuxsampler')
provides=('linuxsampler')
source=(license.txt)
md5sums=('746c1421eb9f6812b5fa411bfb923c75')

_cvsroot=":pserver:anonymous@cvs.linuxsampler.org:/var/cvs/linuxsampler"
_cvsmod="linuxsampler"

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

# install GPL exception statement
  install -Dm0644 ../license.txt \
    "$pkgdir/usr/share/licenses/linuxsampler/GPL-EXCEPTION"

rm -rf $srcdir/$_cvsmod-build
}

