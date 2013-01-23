# Maintainer: Hоàng Đức Hiếu <arch at zahe.me>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>

pkgname=minidlna-cvs
pkgver=20130123
pkgrel=1
pkgdesc="A DLNA/UPnP-AV Media server (aka ReadyDLNA)"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/minidlna/"
license=('GPL')
depends=('libexif' 'libjpeg' 'libid3tag' 'flac' 'ffmpeg' 'sqlite3')
makedepends=('cvs')
conflicts=('minidlna')
install=${pkgname}.install
backup=('etc/minidlna.conf' 'etc/conf.d/minidlna')
source=(minidlna.rc minidlna-user avformat-54.patch
        minidlna.tmpfiles.conf minidlna.service)
md5sums=('8b064a6c344a3ad8029e2619dfe07b77'
         '0558d36f13d0af5da709bae996ec5d4b'
         'de229f59a5de92edf8044759b5c03de7'
         'a97c708490f7b223cd0ad30e2817cbab'
         '18986275707a11229dcf11ebe0f88064')

_cvsroot=":pserver:anonymous:@minidlna.cvs.sourceforge.net:/cvsroot/minidlna"
_cvsmod="minidlna"

build() {
  cd $srcdir

  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  if [ -d ${_cvsmod}/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
    cd $_cvsmod
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}/${_cvsmod}-build"
  cp -r "${srcdir}/${_cvsmod}" "${srcdir}/${_cvsmod}-build"
  cd "${srcdir}/${_cvsmod}-build"

  patch -i "${srcdir}/avformat-54.patch"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${_cvsmod}-build
  make DESTDIR=$pkgdir install

  install -D -m 755 ${srcdir}/minidlna.rc ${pkgdir}/etc/rc.d/minidlna
  install -D -m 644 ${srcdir}/minidlna-user ${pkgdir}/etc/conf.d/minidlna
  install -D -m 644 ${srcdir}/minidlna.service ${pkgdir}/usr/lib/systemd/system/minidlna.service
  install -D -m 644 ${srcdir}/minidlna.tmpfiles.conf ${pkgdir}/usr/lib/tmpfiles.d/minidlna.conf
  install -D -m 644 minidlna.conf ${pkgdir}/etc/minidlna.conf

}
