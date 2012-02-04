# Contributor: my64 <package@obordes.com>

pkgname=portaudio_v18
pkgver=pa_snapshot_v18
pkgrel=3
pkgdesc="A free, cross-platform, open source, audio I/O library"
arch=('i686' 'x86_64')
url="http://www.portaudio.com/"
license=('custom')
depends=('autoconf>=2.13')
source=(http://obor.free.fr/Logiciels/arch_packages/$pkgver.tar.gz)
md5sums=('873f42e891da37cfc7598d65196e481e')
build() {
  cd $startdir/src/${pkgname/_v18/}
  mkdir -p ${startdir}/pkg/usr/{include,lib}
  ./configure --prefix=/usr
  sed -i "s/CFLAGS = /CFLAGS = -fPIC /" Makefile
  make  || return 1
  make PREFIX=${startdir}/pkg/usr install || return 1
  install -D -m644 LICENSE.txt $startdir/pkg/usr/share/licenses/${pkgname/_v18/}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
