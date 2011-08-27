# Contributor: Felix Müller <mueller_felix_AT_freenet.de>
# Maintainer: Felix Müller <mueller_felix_AT_freenet.de>
pkgname=libopensync-plugin-palm
pkgver=0.36
pkgrel=1
pkgdesc='Palm plugin for OpenSync'
url='http://www.opensync.org/'
license=('LGPL')
arch=('i686' 'x86_64')
depends=('libopensync' 'pilot-link')
makedepends=('cmake' 'libxml2')
source=("http://www.opensync.org/download/releases/${pkgver}/libopensync-plugin-palm-${pkgver}.tar.bz2")
options=('!libtool')
md5sums=('ee05ffadee75094d78a15e2704f5e64f')

build() 
{
  cd ${startdir}/src/${pkgname}-${pkgver}
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}

# vim:set ts=2 sw=2 et:
