# Maintainer: Alexander 'z33ky' Hirsch <1zeeky@gmail.com>

pkgname=btogre-git
_gitroot=btogre
pkgver=41.6266297
pkgrel=1
pkgdesc='A thin Bullet-Ogre connection.'
arch=('i686' 'x86_64')
url='http://www.ogre3d.org/forums/viewtopic.php?f=5&t=46856'
license=('zlib')
depends=('bullet' 'ogre')
makedepends=('git' 'cmake')
source=("git://github.com/nikki93/${_gitroot}.git" 'cmake-targets.patch')
md5sums=('SKIP' '04de7ba58a645b96739e50092ae7a067')
sha1sums=('SKIP' 'b705573e40bf33f3ee76f08ebead2b67f577fa4c')

pkgver() {
  cd "${srcdir}/${_gitroot}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd "${srcdir}/${_gitroot}"

  patch -Np1 -i "${srcdir}/cmake-targets.patch"
}

build() {
  cd "${srcdir}/${_gitroot}"

  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr
  make
}

package() {
  cd "${srcdir}/${_gitroot}"

  make DESTDIR="${pkgdir}" install
}
