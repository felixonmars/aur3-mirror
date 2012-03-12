# Maintainer: Markus Opitz <mastero23 at gmail dot com>

pkgname=nx-x11-git
pkgver=20120312
pkgrel=1
pkgdesc="NX customized X11 library"
arch=('i686' 'x86_64')
url="http://www.x2go.org/"
license=('GPL2')
depends=('fontconfig' 'libxfixes' 'libxmu' 'libxpm' 'libxrender' 'nxcomp-x2go-git')
install=nx-x11.install
source=('nx-x11.ld.so.conf.d')
md5sums=('f2ec60c7e2d81bef2f7292d2b33681a6')

_pkgname="${pkgname%-git}"
_gitname="nx-libs"
_gitroot="git://code.x2go.org/$_gitname.git"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build/"
  patch -p1 < debian/patches/006_nxcomp_libpng15.full+lite.patch
  cd nx-X11

  make World
}

package() {
  cd "$srcdir/$_gitname-build/nx-X11"

  install -m 755 -d "$pkgdir/usr/include/nx/"
  cp -r -L exports/include/* "$pkgdir/usr/include/nx/"

  install -m 755 -d "$pkgdir/usr/lib/nx/X11"

  install -m 644 lib/expat/libexpat.so.0.4.0 "$pkgdir/usr/lib/nx/X11/libexpat.so.0.4.0"
  ln -s libexpat.so.0.4.0 "$pkgdir/usr/lib/nx/X11/libexpat.so"
  ln -s libexpat.so.0.4.0 "$pkgdir/usr/lib/nx/X11/libexpat.so.0"

  install -m 644 lib/font/stubs/libfntstubs.a "$pkgdir/usr/lib/nx/X11/libfntstubs.a"

  install -m 644 lib/fontconfig/libfontconfig.so.1.0.4 "$pkgdir/usr/lib/nx/X11/libfontconfig.so.1.0.4"
  ln -s libfontconfig.so.1.0.4 "$pkgdir/usr/lib/nx/X11/libfontconfig.so"
  ln -s libfontconfig.so.1.0.4 "$pkgdir/usr/lib/nx/X11/libfontconfig.so.1"

  install -m 644 lib/fontenc/libfontenc.so.1.0 "$pkgdir/usr/lib/nx/X11/libfontenc.so.1.0"
  ln -s libfontenc.so.1.0 "$pkgdir/usr/lib/nx/X11/libfontenc.so"
  ln -s libfontenc.so.1.0 "$pkgdir/usr/lib/nx/X11/libfontenc.so.1"

  install -m 644 lib/freetype2/libfreetype.a "$pkgdir/usr/lib/nx/X11/libfreetype.a"

  install -m 644 lib/freetype2/libfreetype.so.6.3.7 "$pkgdir/usr/lib/nx/X11/libfreetype.so.6.3.7"
  ln -s libfreetype.so.6.3.7 "$pkgdir/usr/lib/nx/X11/libfreetype.so"
  ln -s libfreetype.so.6.3.7 "$pkgdir/usr/lib/nx/X11/libfreetype.so.6"

  install -m 644 lib/FS/libFS.so.6.0 "$pkgdir/usr/lib/nx/X11/libFS.so.6.0"
  ln -s libFS.so.6.0 "$pkgdir/usr/lib/nx/X11/libFS.so"
  ln -s libFS.so.6.0 "$pkgdir/usr/lib/nx/X11/libFS.so.6"

  install -m 644 lib/ICE/libICE.so.6.4 "$pkgdir/usr/lib/nx/X11/libICE.so.6.4"
  ln -s libICE.so.6.4 "$pkgdir/usr/lib/nx/X11/libICE.so"
  ln -s libICE.so.6.4 "$pkgdir/usr/lib/nx/X11/libICE.so.6"

  install -m 644 lib/oldX/liboldX.a "$pkgdir/usr/lib/nx/X11/liboldX.a"

  install -m 644 lib/SM/libSM.so.6.0 "$pkgdir/usr/lib/nx/X11/libSM.so.6.0"
  ln -s libSM.so.6.0 "$pkgdir/usr/lib/nx/X11/libSM.so"
  ln -s libSM.so.6.0 "$pkgdir/usr/lib/nx/X11/libSM.so.6"

  install -m 644 lib/X11/libX11.so.6.2 "$pkgdir/usr/lib/nx/X11/libX11.so.6.2"
  ln -s libX11.so.6.2 "$pkgdir/usr/lib/nx/X11/libX11.so"
  ln -s libX11.so.6.2 "$pkgdir/usr/lib/nx/X11/libX11.so.6"

  install -m 644 lib/Xau/libXau.a "$pkgdir/usr/lib/nx/X11/libXau.a"

  install -m 644 lib/Xaw7/libXaw.so.7.0 "$pkgdir/usr/lib/nx/X11/libXaw.so.7.0"
  ln -s libXaw.so.7.0 "$pkgdir/usr/lib/nx/X11/libXaw.so"
  ln -s libXaw.so.7.0 "$pkgdir/usr/lib/nx/X11/libXaw.so.7"

  install -m 644 lib/Xcomposite/libXcomposite.so.1.0 "$pkgdir/usr/lib/nx/X11/libXcomposite.so.1.0"
  ln -s libXcomposite.so.1.0 "$pkgdir/usr/lib/nx/X11/libXcomposite.so"
  ln -s libXcomposite.so.1.0 "$pkgdir/usr/lib/nx/X11/libXcomposite.so.1"

  install -m 644 lib/Xcursor/libXcursor.so.1.0.2 "$pkgdir/usr/lib/nx/X11/libXcursor.so.1.0.2"
  ln -s libXcursor.so.1.0.2 "$pkgdir/usr/lib/nx/X11/libXcursor.so"
  ln -s libXcursor.so.1.0.2 "$pkgdir/usr/lib/nx/X11/libXcursor.so.1"

  install -m 644 lib/Xdamage/libXdamage.so.1.0 "$pkgdir/usr/lib/nx/X11/libXdamage.so.1.0"
  ln -s libXdamage.so.1.0 "$pkgdir/usr/lib/nx/X11/libXdamage.so"
  ln -s libXdamage.so.1.0 "$pkgdir/usr/lib/nx/X11/libXdamage.so.1"

  install -m 644 lib/Xdmcp/libXdmcp.a "$pkgdir/usr/lib/nx/X11/libXdmcp.a"

  install -m 644 lib/Xext/libXext.so.6.4 "$pkgdir/usr/lib/nx/X11/libXext.so.6.4"
  ln -s libXext.so.6.4 "$pkgdir/usr/lib/nx/X11/libXext.so"
  ln -s libXext.so.6.4 "$pkgdir/usr/lib/nx/X11/libXext.so.6"

  install -m 644 lib/Xfixes/libXfixes.so.3.0 "$pkgdir/usr/lib/nx/X11/libXfixes.so.3.0"
  ln -s libXfixes.so.3.0 "$pkgdir/usr/lib/nx/X11/libXfixes.so"
  ln -s libXfixes.so.3.0 "$pkgdir/usr/lib/nx/X11/libXfixes.so.3"

  install -m 644 lib/font/libXfont.a "$pkgdir/usr/lib/nx/X11/libXfont.a"

  install -m 644 lib/font/libXfont.so.1.5 "$pkgdir/usr/lib/nx/X11/libXfont.so.1.5"
  ln -s libXfont.so.1.5 "$pkgdir/usr/lib/nx/X11/libXfont.so"
  ln -s libXfont.so.1.5 "$pkgdir/usr/lib/nx/X11/libXfont.so.1"

  install -m 644 lib/Xft1/libXft.so.1.1 "$pkgdir/usr/lib/nx/X11/libXft.so.1.1"
  ln -s libXft.so.1.1 "$pkgdir/usr/lib/nx/X11/libXft.so.1"

  install -m 644 lib/Xft/libXft.so.2.1.2 "$pkgdir/usr/lib/nx/X11/libXft.so.2.1.2"
  ln -s libXft.so.2.1.2 "$pkgdir/usr/lib/nx/X11/libXft.so"
  ln -s libXft.so.2.1.2 "$pkgdir/usr/lib/nx/X11/libXft.so.2"

  install -m 644 lib/X11/xlibi18n/im/ximcp/libximcp.so.2 "$pkgdir/usr/lib/nx/X11/libximcp.so.2"
  ln -s libximcp.so.2 "$pkgdir/usr/lib/nx/X11/libximcp.so"

  install -m 644 lib/X11/xlibi18n/lc/def/libxlcDef.so.2 "$pkgdir/usr/lib/nx/X11/libxlcDef.so.2"
  ln -s libxlcDef.so.2 "$pkgdir/usr/lib/nx/X11/libxlcDef.so"

  install -m 644 lib/X11/xlibi18n/lc/Utf8/libxlcUTF8Load.so.2 "$pkgdir/usr/lib/nx/X11/libxlcUTF8Load.so.2"
  ln -s libxlcUTF8Load.so.2 "$pkgdir/usr/lib/nx/X11/libxlcUTF8Load.so"

  install -m 644 lib/X11/xlibi18n/lc/gen/libxlibi18n.so.2 "$pkgdir/usr/lib/nx/X11/libxlibi18n.so.2"
  ln -s libxlibi18n.so.2 "$pkgdir/usr/lib/nx/X11/libxlibi18n.so"

  install -m 644 lib/X11/xlibi18n/lc/xlocale/libxlocale.so.2 "$pkgdir/usr/lib/nx/X11/libxlocale.so.2"
  ln -s libxlocale.so.2 "$pkgdir/usr/lib/nx/X11/libxlocale.so"

  install -m 644 lib/Xmu/libXmu.so.6.2 "$pkgdir/usr/lib/nx/X11/libXmu.so.6.2"
  ln -s libXmu.so.6.2 "$pkgdir/usr/lib/nx/X11/libXmu.so"
  ln -s libXmu.so.6.2 "$pkgdir/usr/lib/nx/X11/libXmu.so.6"

  install -m 644 lib/Xmuu/libXmuu.so.1.0 "$pkgdir/usr/lib/nx/X11/libXmuu.so.1.0"
  ln -s libXmuu.so.1.0 "$pkgdir/usr/lib/nx/X11/libXmuu.so"
  ln -s libXmuu.so.1.0 "$pkgdir/usr/lib/nx/X11/libXmuu.so.1"

  install -m 644 lib/X11/xlibi18n/om/generic/libxomGeneric.so.2 "$pkgdir/usr/lib/nx/X11/libxomGeneric.so.2"
  ln -s libxomGeneric.so.2 "$pkgdir/usr/lib/nx/X11/libxomGeneric.so"

  install -m 644 lib/Xpm/libXpm.so.4.11 "$pkgdir/usr/lib/nx/X11/libXpm.so.4.11"
  ln -s libXpm.so.4.11 "$pkgdir/usr/lib/nx/X11/libXpm.so"
  ln -s libXpm.so.4.11 "$pkgdir/usr/lib/nx/X11/libXpm.so.4"

  install -m 644 lib/Xrandr/libXrandr.so.2.0 "$pkgdir/usr/lib/nx/X11/libXrandr.so.2.0"
  ln -s libXrandr.so.2.0 "$pkgdir/usr/lib/nx/X11/libXrandr.so"
  ln -s libXrandr.so.2.0 "$pkgdir/usr/lib/nx/X11/libXrandr.so.2"

  install -m 644 lib/Xrender/libXrender.so.1.2.2 "$pkgdir/usr/lib/nx/X11/libXrender.so.1.2.2"
  ln -s libXrender.so.1.2.2 "$pkgdir/usr/lib/nx/X11/libXrender.so"
  ln -s libXrender.so.1.2.2 "$pkgdir/usr/lib/nx/X11/libXrender.so.1"

  install -m 644 lib/Xt/libXt.so.6.0 "$pkgdir/usr/lib/nx/X11/libXt.so.6.0"
  ln -s libXt.so.6.0 "$pkgdir/usr/lib/nx/X11/libXt.so"
  ln -s libXt.so.6.0 "$pkgdir/usr/lib/nx/X11/libXt.so.6"

  install -m 644 lib/Xtst/libXtst.so.6.1 "$pkgdir/usr/lib/nx/X11/libXtst.so.6.1"
  ln -s libXtst.so.6.1 "$pkgdir/usr/lib/nx/X11/libXtst.so"
  ln -s libXtst.so.6.1 "$pkgdir/usr/lib/nx/X11/libXtst.so.6"

  install -m 755 -d "$pkgdir/usr/share/nx"
  install -m 644 programs/Xserver/Xext/SecurityPolicy "$pkgdir/usr/share/nx"

  install -m 755 -d "$pkgdir/etc/ld.so.conf.d/"
  install -m 644 "$srcdir/nx-x11.ld.so.conf.d" "$pkgdir/etc/ld.so.conf.d/nx.conf"
}
