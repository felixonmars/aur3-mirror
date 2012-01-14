# Maintainer: spider-mario <spidermario@free.fr>
pkgname=gnustep-theme-gnome-svn
pkgver=28908
pkgrel=2
pkgdesc="GNOME theme for GNUstep"
arch=(i686 x86_64)
url="http://www.gnustep.org/"
license=('LGPL')
depends=('gnustep-gui' 'gtk2' 'gdk-pixbuf2' 'gconf')
makedepends=('subversion')
install=gnustep-theme-gnome.install
source=(gdk-pixbuf-include-path.patch)
md5sums=('dbd6a2b352d6c66869a7a21b432ee457')

_svntrunk=http://svn.gna.org/svn/gnustep/modules/plugins
_svnmod=gnustep

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
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  patch -p1 < "$startdir"/gdk-pixbuf-include-path.patch

  . /etc/profile.d/GNUstep.sh
  cd themes/GnomeTheme
  make
}

package() {
  cd "$srcdir/$_svnmod-build/themes/GnomeTheme"
  . /etc/profile.d/GNUstep.sh
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
