# Contributor: Ewoud Nuyts <ewoud.nuyts@gmail.com>

pkgname=bmp-flac
pkgver=20040316
pkgrel=2
pkgdesc="FLAC plugin for Beep Media Player"
url="http://ccm.sherry.jp/cgi-bin/libroverde/libroverde.cgi/read/2004/4/12"
license="GPL"
arch=('i686')
depends=('bmp' 'flac')
source=(http://ccm.sherry.jp/tmp/flac-CVS-${pkgver}-with-bmp-plugin.tar.bz2)
md5sums=('9812842caa461e126194ed0ad1d2c7b2')

build() {
  cd $startdir/src/flac-CVS-${pkgver}-with-bmp-plugin/src/plugin_bmp
  patch -i $startdir/bmp-plugin-makefile.in.diff
  cd $startdir/src/flac-CVS-${pkgver}-with-bmp-plugin
  ./configure --prefix=/usr --disable-static
  cd $startdir/src/flac-CVS-${pkgver}-with-bmp-plugin/src/share
  make || return 1
  cd $startdir/src/flac-CVS-${pkgver}-with-bmp-plugin/src/plugin_common
  make || return 1
  cd $startdir/src/flac-CVS-${pkgver}-with-bmp-plugin/src/plugin_bmp
  make || return 1
  make DESTDIR=$startdir/pkg install
}
