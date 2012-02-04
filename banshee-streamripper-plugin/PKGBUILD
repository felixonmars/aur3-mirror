# Maintainer: finswimmer (finswimmer77 at gmail dot com)
pkgname=banshee-streamripper-plugin
pkgver=0.1
pkgrel=1
pkgdesc="Extension for banshee that allows users to rip mp3-files out of radiostreams with streamripper."
arch=('i686' 'x86_64')
url="http://code.google.com/p/banshee-streamripper"
license="MIT"
depends=('banshee' 'streamripper')
source=(http://banshee-streamripper.googlecode.com/files/banshee-streamripper-${pkgver}.tar.gz)
md5sums=('c3a9e4a5984ba01d4f8c70c832e7e98d')

build() {
  cd ${srcdir}/banshee-streamripper-${pkgver}
  export MONO_SHARED_DIR=$startdir/src/


  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

}
