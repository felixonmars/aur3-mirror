# Contributor: Michael Kaiser <kallewirsch@hotmail.de>
pkgname=kradio4-svn
pkgver=003
pkgrel=1
pkgdesc="KRadio is a comfortable KDE radio application"
arch=(i686 x86_64)
url="http://kradio.sourceforge.net"
license=('GPL')
depends=('libsndfile' 'kdelibs>=4.2.0' 'lame' 'ffmpeg' 'libmms>=0.5' 'libogg' 'libvorbis' 'lirc>=0.8.0'  'dbus' 'alsa-lib' )
makedepends=('svn' 'cmake>=2.6.2')
source=()
md5sums=()

_svntrunk='https://kradio.svn.sourceforge.net/svnroot/kradio/trunk'
_svnmod='kradio'

build() {
cd "${srcdir}"

svn co $_svntrunk $_svnmod

msg "SVN checkout done or server timeout"
msg "Starting make..."

cp -r $_svnmod $_svnmod-build
cd $_svnmod-build

cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE

make VERBOSE=1 || return 1
make DESTDIR="${pkgdir}" install || return 1

rm -rf ${srcdir}/$_svnmod-build
}
