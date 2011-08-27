# $Id: PKGBUILD,v 1.7 2007/04/09 20:06:04 jgc Exp $
# Maintainer: Jan de Groot <jgc@archlinux.org>
pkgname=libgphoto2-sharp
pkgver=2.3.0
pkgrel=1
pkgdesc="C# bindings for libgphoto2"
arch=(i686 x86_64)
license=('GPL')
url="http://sourceforge.net/projects/gphoto/"
depends=('libgphoto2>=2.3.1' 'mono>=1.2.3.1')
source=(http://downloads.sourceforge.net/sourceforge/gphoto/${pkgname}-${pkgver}.tar.bz2)
md5sums=('')

build() {
  export MONO_SHARED_DIR=${startdir}/src/.wabi
  mkdir -p "${MONO_SHARED_DIR}"

  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --disable-docs --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install

  rm -fr "${MONO_SHARED_DIR}"
}
