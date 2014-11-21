# Maintainer: bwrsandman <bwrsandman@gmail.com>
# PKGBUILD source: https://github.com/bwrsandman/pkgbuild/tree/master/ogitor-hg

pkgname=ogitor-hg
pkgver=r796.24aed880f704
pkgrel=1
pkgdesc="Scene editing framework for Ogre3D"
arch=('i686' 'x86_64')
url='http://www.ogitor.org'
license=('LGPL')
depends=('ogre' 'qt4' 'python2')
makedepends=('cmake' 'mercurial' 'unzip')
conflicts=('ogitor')
provides=('ogitor')

source=(${pkgname%-hg}::hg+https://bitbucket.org/jacmoe/ogitor
        https://bitbucket.org/jacmoe/ogitor/downloads/media.zip
        https://bitbucket.org/jacmoe/ogitor/downloads/projects.zip
        prefix_fix.patch)
md5sums=('SKIP'
         'c43578ed01e383a0eebd0719ae4241f8'
         'b93a9391b3d6e4d835e6a9bfffb3e6e9'
         '615041ce51a436ecab3e059b799d1e05')

pkgver() {
  cd "${srcdir}/${pkgname%-hg}"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd "${srcdir}/${pkgname%-hg}"
  patch -p1 < "${srcdir}"/prefix_fix.patch
}

build() {
  cd "${srcdir}/${pkgname%-hg}"

  mv "${srcdir}/Media" RunPath/ 
  mv "${srcdir}/Projects" RunPath/ 

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT=True \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7
  make
}

package() {
  cd "${srcdir}/${pkgname%-hg}"
  make DESTDIR=${pkgdir} install 
  mkdir -p ${pkgdir}/usr/share/pixmaps
  cp qtOgitor/res/icons/qtOgitor.svg ${pkgdir}/usr/share/pixmaps/qtogitor.svg
}

# vim:set ts=2 sw=2 et:
