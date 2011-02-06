# Maintainer: Philipp Überbacher <murks at lavabit dot com>
pkgname=rhsp
pkgver=4
pkgrel=1
pkgdesc="Synth and effect plugins for rhost."
arch=('i686' 'x86_64')
url="http://sites.google.com/site/rockhardbuns/rhsp"
license=('GPL' 'custom:public domain')
depends=('cairo' 'gcc-libs')
install=
source=(http://sites.google.com/site/rockhardbuns/rhsp/plugins_src.tar.gz licenses.txt)
md5sums=('3e222ea555bd9e2bcb59ed4ca5ef987e'
         'c1fe2cdbce51b61a02d7d91622200902')

build() {
  
  install -D "${srcdir}/licenses.txt" "${pkgdir}/usr/share/licences/${pkgname}/licenses.txt" || return 1

  cd "${srcdir}/plugins/plugins/dulcimator2"
  make config=release || return 1
  install -Dm644 bin/release/dulcimator2.so "${pkgdir}/usr/lib/rhsp/dulcimator2.so" || return 1

  cd "${srcdir}/plugins/plugins/opo"
  make config=release || return 1
  install -Dm644 bin/release/opo.so "${pkgdir}/usr/lib/rhsp/opo.so" || return 1
  
  cd "${srcdir}/plugins/plugins/piper2"
  make config=release || return 1
  install -Dm644 bin/release/piper2.so "${pkgdir}/usr/lib/rhsp/piper2.so" || return 1

  cd "${srcdir}/plugins/plugins/vanilla_surprise"
  make config=release || return 1
  install -Dm644 bin/release/vanilla.so "${pkgdir}/usr/lib/rhsp/vanilla.so" || return 1

  cd "${srcdir}/plugins/plugins/perpetua"
  make config=release || return 1
  install -Dm644 bin/release/perpetua.so "${pkgdir}/usr/lib/rhsp/perpetua.so" || return 1

}

# vim:set ts=2 sw=2 et:
