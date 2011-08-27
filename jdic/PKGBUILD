# Contributor: Jesus Lazaro Plaza <jesuslazaro84 at gmail dot com>

pkgname=jdic
pkgver=0.9.5
pkgrel=4
_deb_pkgrel=7
pkgdesc="JDesktop Integration Components. From debian package 'libjdic-bin'"
arch=('i686' 'x86_64')
url="https://jdic.dev.java.net/"
license=('custom')
depends=('cairo' 'libgnome' 'gtk2' 'nspr' 'libstdc++5' 'libx11' 'libxt')
makedepends=('unzip')
[ "$CARCH" = "x86_64" ] && _deb_arch=amd64
[ "$CARCH" = "i686" ] && _deb_arch=i386
source=(ftp://ftp.debian.org/debian/pool/main/libj/libjdic-java/libjdic-bin_${pkgver}-${_deb_pkgrel}_${_deb_arch}.deb)
[ "$CARCH" = "x86_64" ] && md5sums=('613e13faf978cbe7a63aa685e28f19ee')
[ "$CARCH" = "i686" ] && md5sums=('1be201b78ac69c992c49926ff7ad53f7')

build() {
   cd ${srcdir}
   ar x libjdic-bin_${pkgver}-${_deb_pkgrel}_${_deb_arch}.deb
   tar xzf data.tar.gz -C ${pkgdir}
   install -D -m644 ${pkgdir}/usr/share/doc/libjdic-bin/copyright ${pkgdir}/usr/share/licenses/jdic/copyright
   rm -fR ${pkgdir}/usr/share/doc
}
