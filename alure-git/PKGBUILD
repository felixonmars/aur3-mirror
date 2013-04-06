# Contributor: Markus Martin
# Contributor: kfgz <kfgz at interia pl>

_pkgname=alure
pkgname=alure-git
pkgver=0.453.38e5640
pkgrel=1
epoch=1
pkgdesc="Utility library to help manage common tasks with OpenAL applications."
arch=('i686' 'x86_64')
url="http://kcat.strangesoft.net/alure.html"
license=('LGPL')
depends=('openal')
makedepends=('cmake')
conflicts=('alure')
provides=('alure')
optdepends=('libsndfile: Uncompressed audio support'
            'libsdnfile: OGG Vorbis support'
            'flac: FLAC support')
source=('git://repo.or.cz/alure.git')
md5sums=('SKIP')


pkgver() {
  cd $_pkgname
  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
  cd ${srcdir}/${_pkgname}
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/${_pkgname}
  make DESTDIR=${pkgdir} install
}
