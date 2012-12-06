# Contributor: Stefan Lohmaier <stefan.lohmaier@gmail.com>
pkgname=qtcreator-doxygen-svn
pkgver=55
pkgrel=1
pkgdesc="Simple QtCreator plugin that inserts Doxygen tags in source code and handles interaction with Doxygen binaries."
arch=(i686 x86_64)
url="http://dev.kofee.org/projects/qtcreator-doxygen"
license=('GPL')
depends=('qtcreator' 'doxygen')
makedepends=('subversion')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_svntrunk=http://svn.kofee.org/svn/qtcreator-doxygen/trunk
_svnmod=qtcreator-doxygen

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  svn export "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD HERE
  #
  sed -i "s/2\\.5\\.0/2\\.6\\.0/g" Doxygen.pluginspec
  qmake QTC_SOURCE_DIR=/usr/src/qtcreator/ LIBS="-L/usr/lib/qtcreator/ -L/usr/lib/qtcreator/plugins/QtProject" DEST=${pkgdir}/usr/lib/qtcreator/plugins/Doxygen . && make
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  #for i in Core CppEditor CppTools Locator ProjectExplorer TextEditor
  #do
  #  ln -s /usr/lib/qtcreator/plugins/QtProject/lib$i.so ${pkgdir}/usr/lib/qtcreator/plugins/Doxygen
  #done
}

# vim:set ts=2 sw=2 et:
