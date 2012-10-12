# Maintainer: orbisvicis <''.join(chr(ord(c)-1) for c in "pscjtwjdjtAhnbjm/dpn")>
pkgname=osm2poidb-svn
pkgver=20375
pkgrel=3
pkgdesc="Create a sqlite3 database containing poi data from a given osm xml file"
arch=("i686" "x86_64")
url="http://wiki.openstreetmap.org/"
license=("GPL")
depends=("sqlite" "gtk2" "libxml2" "openstreetmap-map-icons-svn")
makedepends=("subversion" "cmake>=2.4.3")
optdepends=("gpsdrive: use the poi databases")
provides=("${pkgname%-svn}")
conflicts=("${pkgname%-svn}")
backup=()
options=()

_svntrunk="http://svn.openstreetmap.org/applications/utils/export/osm2poidb/"
_svnmod="osm2poidb"

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "${_svnmod}/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "${srcdir}/${_svnmod}-build"
  cp -a "${srcdir}/${_svnmod}" "${srcdir}/${_svnmod}-build"
  cd "${srcdir}/${_svnmod}-build"

  #
  # BUILD
  #
  rm -rf build
  mkdir build
  cd build

  # default to the geoinfo.db file provided by the openstreetmap-map-icons-svn package
  sed -i 's|#define DB_GEOINFO "/usr/share/gpsdrive/geoinfo.db"|#define DB_GEOINFO "/usr/share/icons/map-icons/geoinfo.db"|' "${srcdir}/${_svnmod}-build/osm2poidb.c"

  cmake -DCMAKE_INSTALL_PREFIX="/usr" "${srcdir}/${_svnmod}-build"
  make
}

package() {
  cd "${srcdir}/${_svnmod}-build/build"
  make DESTDIR="$pkgdir" install
}
