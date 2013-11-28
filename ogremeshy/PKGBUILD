# Maintainer: Sandy Carter <bwrsandman@gmail.com>
# PKGBUILD source: https://github.com/bwrsandman/pkgbuild/tree/master/ogremeshy

pkgname=ogremeshy
pkgver=1.5
pkgrel=2
pkgdesc="A tool for viewing OGRE mesh files."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/ogremeshy/"
license=('GPL3')

depends=('ogre' 'wxgtk')
makedepends=('cmake')

source=(http://sourceforge.net/projects/$pkgname/files/OgreMeshy.$pkgver.src.tar.bz2
        ogremeshy.sh
        ogremeshy.desktop
        boost_fix.patch
        install_resources.patch)
sha256sums=('4d64bbe293005a9b57fd9d56f692bf2836b9467c3039fe702df2a4c5877b7e31'
            '506036834ca132c59d558aba4bbbc3d18740d8e3abfd136df3dd82f1f8016c20'
            '7b6577ca1fd358d768a641299ae297d7132ed861b8f2e5f17fea6cd8d5f1a855'
            'db83866a5322945a2b2701fa453165609eca7456111bf56bb70ee6188c83ffbf'
            '91b92849a2e49ced78c9e017683aea03cb4700a448f2bf1ce4c090527ad1dbca')

prepare() {
  cd "${srcdir}"/OgreMeshy

  # Insert .desktop and .sh files for installation
  cp "${srcdir}"/ogremeshy.{desktop,sh} bin/Release_Linux

  # Tell OgreMeshy where to find the OGRE plugins
  sed -i "s/PluginFolder=\/opt\/ogremeshy\/Plugins/PluginFolder=\/usr\/lib\/OGRE/g" \
        bin/Release_Linux/Plugins.cfg

  # Fix CMakeLists.txt
  patch < "${srcdir}"/boost_fix.patch
  patch < "${srcdir}"/install_resources.patch
}

build() {
  cd "$srcdir"/OgreMeshy
  cmake -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release
  make 
}

package() {
  cd "$srcdir"/OgreMeshy
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
