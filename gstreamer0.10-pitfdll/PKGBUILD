pkgname=gstreamer0.10-pitfdll
pkgver=0.9.1.1+cvs20080215
pkgrel=4
arch=('i686')
license=('GPL')
pkgdesc="Win32 DLL loader for Gstreamer"
url="http://ronald.bitfreak.net/pitfdll.php"
depends=('gstreamer0.10-base>=0.10.13' 'codecs')
groups=('gstreamer0.10-plugins')
source=(http://ftp.de.debian.org/debian/pool/contrib/g/$pkgname/${pkgname}_${pkgver}.orig.tar.gz)
options=('!libtool')
md5sums=('d4f94f09a7f24889bf858d315d136df5')

build() {
  cd ${startdir}/src/pitfdll-0.9.1.1
  export CFLAGS="$CFLAGS -DHAVE_VSSCANF=1"
  ./configure --prefix=/usr --with-dlldir=/usr/lib/codecs
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
