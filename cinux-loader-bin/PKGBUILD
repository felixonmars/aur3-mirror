# Maintainer: kfgz <kfgz at interia dot pl>
# Contributor: <dotb52 at gmail dot com>

pkgname=cinux-loader-bin
pkgver=2.02
pkgrel=1
pkgdesc="A console application written in C that download automatic files from file hosting services like RapidShare. Binary version with DLC support."
arch=('i686' 'x86_64')
url="http://cinux-loader.sourceforge.net/"
options=(!strip)
license=('GPL3')
depends=('curl' 'pcre' 'openssl' 'gocr' 'imagemagick')
provides=('cinux-loader')
source=("cinux-loader-${arch}-pc-linux-gnu-${pkgver}.tar.bz2::http://sourceforge.net/projects/cinux-loader/files/CinuxLoader/${pkgver}/Binaries/cinux-loader-${arch}-pc-linux-gnu-${pkgver}.tar.bz2/download"
        "makefile.patch")
md5sums=('b882842e5a59c16339d5d5d4d1c1ae26'
         '2a1ddde8185d2f7a39735a67c3f8f876')
sha256sums=('b986bdd531270b8226cc527d3d3281b2a200f29da6f483bc1584a972999fed27'
            'fd154655261ac63368e4a2f562c88dff813203aba9486318df89fcf68a60f38c')

package() {
  cd ${srcdir}/cinux-loader-${arch}-pc-linux-gnu-${pkgver}
  patch < ${startdir}/makefile.patch
  make DESTDIR=${pkgdir} install
  
  if [ ! -f /usr/lib/libpcre.so.0 ]; then \
    mkdir -p ${pkgdir}/usr/lib
    if [ -f /usr/lib/libpcre.so ]; then \
	    ln -sv /usr/lib/libpcre.so ${pkgdir}/usr/lib/libpcre.so.0; \
	else \
		ln -sv `ls /usr/lib/libpcre.so.* | head -n1` ${pkgdir}/usr/lib/libpcre.so.0; \
	    fi \
  fi
}
