# Maintainer: stqn
# Contributor: doitian

pkgname=vlc-srpos-plugin
pkgver=0.5
pkgrel=1
pkgdesc="This plugin allows you to automatically save and restore the position of the last 100 played files in the VLC player."
arch=('i686' 'x86_64')
url="http://vlcsrposplugin.sourceforge.net/"
license=("LGPL")
depends=("vlc>=2.2.0")
source=("http://downloads.sourceforge.net/project/vlcsrposplugin/libsrpos_plugin-${pkgver}.tar.gz")
sha256sums=('983ef1857ef1bb6378535f31fbf0ea933aad3a6d169660a36058811f10e46d69')

# You can configure the number of video clips the plugin will remember (default is 100):
_max_items_remembered=100

prepare() {
	sed -i "s/int n_max_items = 100;/int n_max_items = ${_max_items_remembered};/" "${srcdir}/libsrpos_plugin-${pkgver}/srpos.c"
}

build() {
  cd "${srcdir}/libsrpos_plugin-${pkgver}"
  ./configure
  make
}

package() {
  cd "${srcdir}/libsrpos_plugin-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
