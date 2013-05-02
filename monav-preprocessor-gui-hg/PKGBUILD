# Maintainer: Micael Dias <kam1kaz3@gmail.com>
_pkg="monav-preprocessor-gui"
pkgname=${_pkg}-hg
_hgrepo="monav"
pkgver=517.61309400c5e9
pkgrel=1
pkgdesc="preprocessor for generating MoNav map modules - GUI version"
arch=("i686" "x86_64")
url="http://code.google.com/p/monav/"
license=("GPL3")
depends=("qt4" "protobuf" "mapnik" "bzip2" "boost-libs")
makedepends=("mercurial" "qt4" "mapnik" "bzip2" "protobuf" "boost" "boost-libs")
provides=("$_pkg")
conflicts=("$_pkg")
source=(
  "hg+https://code.google.com/p/${_hgrepo}/"
  mapnik-2.1.patch
  )
md5sums=(
  'SKIP'
  '59368261c24becea4eebab3b80d3ba40'
)

pkgver() {
  cd "${srcdir}/${_hgrepo}"
  echo $(hg identify -n).$(hg identify -i)
}

build() {
  cd "${srcdir}/${_hgrepo}"

  rm -rf "${srcdir}/${_hgrepo}-build"
  cd "${srcdir}/${_hgrepo}" && hg archive "${srcdir}/${_hgrepo}-build"
  cd "${srcdir}/${_hgrepo}-build"

  # regenerate protocol files
    # (unneeded from r510 on, but keeping here just
    # in case protobuf gets updated again)
  #protoc -I="plugins/osmimporter/protobuff definitions" --cpp_out="plugins/osmimporter/protobuff definitions" "plugins/osmimporter/protobuff definitions"/fileformat.proto
  #protoc -I="plugins/osmimporter/protobuff definitions" --cpp_out="plugins/osmimporter/protobuff definitions" "plugins/osmimporter/protobuff definitions"/osmformat.proto

  # patch to fix un-updated mapnik changes
  patch -p1 < "${srcdir}/mapnik-2.1.patch"

  # generate make files
  qmake-qt4 CONFIG+=release monavpreprocessor-gui.pro

  # make
  make
}

package() {
  #cd "${srcdir}/${_hgrepo}-build"
  #make INSTALL_ROOT="${pkgdir}" install

  # for some reason the "make install" is reporting "nothing to do", so lets do this manually
  install -m755 -d "${pkgdir}/usr/bin"
  install -m755 -t "${pkgdir}/usr/bin" "${srcdir}/${_hgrepo}-build/bin/monav-preprocessor-gui"
}

# vim:set ts=2 sw=2 et:
