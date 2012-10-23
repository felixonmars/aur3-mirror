pkgname=qwired
pkgver=470
pkgrel=3
pkgdesc="Multi-platform client for the Wired protocol. It is written in C++ and using the Qt4 framework, providing a very good multi-platform experience for the user."
arch=(i686 x86_64)
license=("GPL v2")
depends=(lua qt qtwebkit)
makedepends=(qt subversion)
url="http://qwired-suite.blogspot.com"
_svntrunk="http://qwired-suite.googlecode.com/svn/trunk/"
_svnmod="qwired"

build() {
  cd "${srcdir}"

  if [ -d "${_svnmod}/.svn" ]; then
    (cd "$_svnmod" && svn up -r $pkgver)
  else
    svn co "$_svntrunk" --config-dir ./ -r $pkgver $_svnmod
  fi

  msg 'SVN checkout done or server timeout'

  rm -rf "${_svnmod}-build"
  cp -r "$_svnmod" "${_svnmod}-build"
  cd "${_svnmod}-build/qw_library"
  
  qmake qw_library.pro
  make
  cd "../qw_client"
  qmake qw_client.pro
  make
}

package() {
  cd "${srcdir}/${_svnmod}-build/"
  install -Dm755 "bin/qwired" "$pkgdir/usr/bin/qwired"
  install -Dm644 "contrib/QwiredLogo.svg" "$pkgdir/usr/share/icons/$pkgname.svg"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  mkdir -p "$pkgdir/usr/share/applications"
  echo '[Desktop Entry]
Categories=Network;FileTransfer;P2P
Exec=qwired
GenericName=Wired Client
Icon=qwired.svg
Name=Qwired
Type=Application' > "$pkgdir/usr/share/applications/$pkgname.desktop"
}
