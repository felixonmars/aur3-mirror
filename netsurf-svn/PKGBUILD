# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Georgij Kondratjev <smpuj@bk.ru>
pkgname=netsurf-svn
pkgver=13902
pkgrel=1
pkgdesc="Lightweight and fast web browser"
arch=('x86_64' 'i686')
url="http://www.netsurf-browser.org/"
license=("GPL")
depends=('libmng' 'libglade' 'lcms' 'librsvg' 'lemon' 'cairo' 'desktop-file-utils')
makedepends=('re2c' 'curl' 'libnsbmp' 'libnsgif' 'libcss' 'hubbub' 'libparserutils' 'libdom-svn')
provides=('netsurf')
conflicts=('netsurf')
source=("$pkgname.desktop"
        "$pkgname.png::http://ubuntu.allmyapps.com/data/n/e/netsurf-netsurf-web-browser/icon_48x48_netsurf.png")
sha256sums=('d800b34e33a10799881f0ad515d1db83c6a5ac3973b5c142a25ad00ca1ac935d'
            'f0dbcc5d80bf03d706aa8b28a322aa7f169a40813848c2d1505691f6e2c7ef00')
install=$pkgname.install
_svntrunk=svn://svn.netsurf-browser.org/trunk/netsurf
_svnmod=netsurf-svn

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"

  cp -rT $_svnmod $_svnmod-build
  ln -sf $_svnmod-build netsurf # will not compile otherwise
  cd netsurf

  msg2 "Compiling Netsurf..."
  make

  msg2 "Creating wrapperscript..."
  echo "#!/bin/sh" > netsurf.sh
  echo "NETSURFRES=/usr/share/netsurf/res /usr/bin/nsgtk \$*" >> netsurf.sh
}

package() {
  cd "$srcdir/netsurf"

  msg2 "Packaging executables..."
  mkdir -p "$pkgdir/usr/bin"
  install nsgtk "$pkgdir/usr/bin"
  install -Dm755 netsurf.sh "$pkgdir/usr/bin/netsurf"
  install -d "$pkgdir/usr/bin" "$pkgdir/usr/share/netsurf"

  msg2 "Packaging resources..."
  rm -rf gtk/res/.svn gtk/res/docs/.svn
  cp -RL gtk/res "$pkgdir/usr/share/netsurf"

  msg2 "Packaging application shortcut and icon"
  install -Dm644 "../$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "../$pkgname.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"

  msg2 "Cleaning up..."
  find "$pkgdir" -name ".svn" -print0 | xargs -0 rm -rf
}

# vim:set ts=2 sw=2 et:
