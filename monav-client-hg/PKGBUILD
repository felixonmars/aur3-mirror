# Maintainer: Micael Dias <kam1kaz3@gmail.com>
_pkg="monav-client"
pkgname=${_pkg}-hg
_hgrepo="monav"
pkgver=517.61309400c5e9
pkgrel=1
pkgdesc="preprocessor for generating MoNav map modules - GUI version"
arch=("i686" "x86_64")
url="http://code.google.com/p/monav/"
license=("GPL3")
depends=("qt4" "qtmobility" "protobuf" "mapnik" "bzip2" "boost-libs")
makedepends=("mercurial" "qt4" "qtmobility" "mapnik" "bzip2" "protobuf" "boost" "boost-libs")
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

  # hack to force the client config to output to correct prefix
  sed -i -e 's#target.path = /usr/local/bin#target.path = /usr/bin#' ./client/client.pro

  # patch to fix un-updated mapnik changes
  patch -p1 < "${srcdir}/mapnik-2.1.patch"

  # generate make files
  qmake-qt4 CONFIG+=release monavclient.pro

  # make
  make
}

package() {
  cd "${srcdir}/${_hgrepo}-build"
  make INSTALL_ROOT="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
