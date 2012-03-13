# Contributor: Markus Opitz <mastero23 at gmail dot com>
# Maintainer: Milan Knížek <knizek@volny.cz>

pkgname=nx-x11
pkgver=3.5.0.12
pkgrel=1
pkgdesc="NX customized X11 library"
arch=('i686' 'x86_64')
url="http://www.x2go.org/"
license=('GPL2')
depends=('libjpeg' 'libpng' 'gcc-libs')
conflicts=("${pkgname}-git")
install=${pkgname}.install
source=('nx-x11.ld.so.conf.d'
        "http://code.x2go.org/releases/source/nx-libs/nx-libs_${pkgver}-full.tar.gz")
#        'nxcomp_Png.cpp.patch'
md5sums=('f2ec60c7e2d81bef2f7292d2b33681a6'
         '08b85600eae432662d3931e92c93732b')

build() {
  cd "$srcdir/nx-libs_${pkgver}"
  sed --in-place=orig \
    's!test -d nxproxy \&\& cd nxproxy \&\& autoconf \&\& ./configure \&\& make!# removed line here!' \
    Makefile
#  patch -p1 < ../nxcomp_Png.cpp.patch
  make || return 1
}

package() {
  cd "$srcdir/nx-libs_${pkgver}/nx-X11"

  install -m 755 -d "$pkgdir/usr/include/nx/X11"
  cp -r -L exports/include/* "$pkgdir/usr/include/nx/X11"

  install -m 755 -d "$pkgdir/usr/lib/nx/X11/Xinerama"

  install -m 644 lib/FS/libNX_FS.so.6.0 "$pkgdir/usr/lib/nx/X11/libNX_FS.so"
  ln -s libNX_FS.so "$pkgdir/usr/lib/nx/X11/libNX_FS.so.6.0"
  ln -s libNX_FS.so "$pkgdir/usr/lib/nx/X11/libNX_FS.so.6"

  install -m 644 lib/ICE/libNX_ICE.so.6.4 "$pkgdir/usr/lib/nx/X11/libNX_ICE.so"
  ln -s libNX_ICE.so "$pkgdir/usr/lib/nx/X11/libNX_ICE.so.6.4"
  ln -s libNX_ICE.so "$pkgdir/usr/lib/nx/X11/libNX_ICE.so.6"

  install -m 644 lib/SM/libNX_SM.so.6.0 "$pkgdir/usr/lib/nx/X11/libNX_SM.so"
  ln -s libNX_SM.so "$pkgdir/usr/lib/nx/X11/libNX_SM.so.6.0"
  ln -s libNX_SM.so "$pkgdir/usr/lib/nx/X11/libNX_SM.so.6"

  install -m 644 lib/X11/libNX_X11.so.6.2 "$pkgdir/usr/lib/nx/X11/libNX_X11.so"
  ln -s libNX_X11.so "$pkgdir/usr/lib/nx/X11/libNX_X11.so.6.2"
  ln -s libNX_X11.so "$pkgdir/usr/lib/nx/X11/libNX_X11.so.6"

  install -m 644 lib/Xau/libNX_Xau.so.6.0 "$pkgdir/usr/lib/nx/X11/libNX_Xau.so"
  ln -s libNX_Xau.so "$pkgdir/usr/lib/nx/X11/libNX_Xau.so.6.0"
  ln -s libNX_Xau.so "$pkgdir/usr/lib/nx/X11/libNX_Xau.so.6"

  install -m 644 lib/Xaw7/libNX_Xaw.so.7.0 "$pkgdir/usr/lib/nx/X11/libNX_Xaw.so"
  ln -s libNX_Xaw.so "$pkgdir/usr/lib/nx/X11/libNX_Xaw.so.7.0"
  ln -s libNX_Xaw.so "$pkgdir/usr/lib/nx/X11/libNX_Xaw.so.7"

  install -m 644 lib/Xcomposite/libNX_Xcomposite.so.1.0 "$pkgdir/usr/lib/nx/X11/libNX_Xcomposite.so"
  ln -s libNX_Xcomposite.so "$pkgdir/usr/lib/nx/X11/libNX_Xcomposite.so.1.0"
  ln -s libNX_Xcomposite.so "$pkgdir/usr/lib/nx/X11/libNX_Xcomposite.so.1"

  install -m 644 lib/Xcursor/libNX_Xcursor.so.1.0.2 "$pkgdir/usr/lib/nx/X11/libNX_Xcursor.so"
  ln -s libNX_Xcursor.so "$pkgdir/usr/lib/nx/X11/libNX_Xcursor.so.1.0.2"
  ln -s libNX_Xcursor.so "$pkgdir/usr/lib/nx/X11/libNX_Xcursor.so.1"

  install -m 644 lib/Xdamage/libNX_Xdamage.so.1.0 "$pkgdir/usr/lib/nx/X11/libNX_Xdamage.so"
  ln -s libNX_Xdamage.so "$pkgdir/usr/lib/nx/X11/libNX_Xdamage.so.1.0"
  ln -s libNX_Xdamage.so "$pkgdir/usr/lib/nx/X11/libNX_Xdamage.so.1"

  install -m 644 lib/Xdmcp/libNX_Xdmcp.so.6.0 "$pkgdir/usr/lib/nx/X11/libNX_Xdmcp.so"
  ln -s libNX_Xdmcp.so "$pkgdir/usr/lib/nx/X11/libNX_Xdmcp.so.6.0"
  ln -s libNX_Xdmcp.so "$pkgdir/usr/lib/nx/X11/libNX_Xdmcp.so.6"

  install -m 644 lib/Xext/libNX_Xext.so.6.4 "$pkgdir/usr/lib/nx/X11/libNX_Xext.so"
  ln -s libNX_Xext.so "$pkgdir/usr/lib/nx/X11/libNX_Xext.so.6.4"
  ln -s libNX_Xext.so "$pkgdir/usr/lib/nx/X11/libNX_Xext.so.6"

  install -m 644 lib/Xfixes/libNX_Xfixes.so.3.0 "$pkgdir/usr/lib/nx/X11/libNX_Xfixes.so"
  ln -s libNX_Xfixes.so "$pkgdir/usr/lib/nx/X11/libNX_Xfixes.so.3.0"
  ln -s libNX_Xfixes.so "$pkgdir/usr/lib/nx/X11/libNX_Xfixes.so.3"

# MK: this is weird, it seems to differ from DEBIAN install
  install -m 644 lib/Xft/libNX_Xft.so.2.1.2 "$pkgdir/usr/lib/nx/X11/libNX_Xft.so"
  ln -s libNX_Xft.so "$pkgdir/usr/lib/nx/X11/libNX_Xft.so.2.1.2"
  ln -s libNX_Xft.so "$pkgdir/usr/lib/nx/X11/libNX_Xft.so.2"
  install -m 644 lib/Xft1/libNX_Xft.so.1.1 "$pkgdir/usr/lib/nx/X11/libNX_Xft.so.1"
  ln -s libNX_Xft.so "$pkgdir/usr/lib/nx/X11/libNX_Xft.so.1.1"

  install -m 644 lib/Xinerama/libNX_Xinerama.so.1.0 "$pkgdir/usr/lib/nx/X11/libNX_Xinerama.so"
  ln -s libNX_Xinerama.so "$pkgdir/usr/lib/nx/X11/libNX_Xinerama.so.1.0"
  ln -s libNX_Xinerama.so "$pkgdir/usr/lib/nx/X11/libNX_Xinerama.so.1"

  install -m 644 lib/Xmu/libNX_Xmu.so.6.2 "$pkgdir/usr/lib/nx/X11/libNX_Xmu.so"
  ln -s libNX_Xmu.so "$pkgdir/usr/lib/nx/X11/libNX_Xmu.so.6.2"
  ln -s libNX_Xmu.so "$pkgdir/usr/lib/nx/X11/libNX_Xmu.so.6"

  install -m 644 lib/Xmuu/libNX_Xmuu.so.1.0 "$pkgdir/usr/lib/nx/X11/libNX_Xmuu.so"
  ln -s libNX_Xmuu.so "$pkgdir/usr/lib/nx/X11/libNX_Xmuu.so.1.0"
  ln -s libNX_Xmuu.so "$pkgdir/usr/lib/nx/X11/libNX_Xmuu.so.1"

  install -m 644 lib/Xpm/libNX_Xpm.so.4.11 "$pkgdir/usr/lib/nx/X11/libNX_Xpm.so"
  ln -s libNX_Xpm.so "$pkgdir/usr/lib/nx/X11/libNX_Xpm.so.4.11"
  ln -s libNX_Xpm.so "$pkgdir/usr/lib/nx/X11/libNX_Xpm.so.4"

  install -m 644 lib/Xrandr/libNX_Xrandr.so.2.0 "$pkgdir/usr/lib/nx/X11/libNX_Xrandr.so"
  ln -s libNX_Xrandr.so "$pkgdir/usr/lib/nx/X11/libNX_Xrandr.so.2.0"
  ln -s libNX_Xrandr.so "$pkgdir/usr/lib/nx/X11/libNX_Xrandr.so.2"

  install -m 644 lib/Xrender/libNX_Xrender.so.1.2.2 "$pkgdir/usr/lib/nx/X11/libNX_Xrender.so"
  ln -s libNX_Xrender.so "$pkgdir/usr/lib/nx/X11/libNX_Xrender.so.1.2.2"
  ln -s libNX_Xrender.so "$pkgdir/usr/lib/nx/X11/libNX_Xrender.so.1"

  install -m 644 lib/Xt/libNX_Xt.so.6.0 "$pkgdir/usr/lib/nx/X11/libNX_Xt.so"
  ln -s libNX_Xt.so "$pkgdir/usr/lib/nx/X11/libNX_Xt.so.6.0"
  ln -s libNX_Xt.so "$pkgdir/usr/lib/nx/X11/libNX_Xt.so.6"

  install -m 644 lib/Xtst/libNX_Xtst.so.6.1 "$pkgdir/usr/lib/nx/X11/libNX_Xtst.so"
  ln -s libNX_Xtst.so "$pkgdir/usr/lib/nx/X11/libNX_Xtst.so.6.1"
  ln -s libNX_Xtst.so "$pkgdir/usr/lib/nx/X11/libNX_Xtst.so.6"

  install -m 644 lib/expat/libNX_expat.so.0.4.0 "$pkgdir/usr/lib/nx/X11/libNX_expat.so"
  ln -s libNX_expat.so "$pkgdir/usr/lib/nx/X11/libNX_expat.so.0.4.0"
  ln -s libNX_expat.so "$pkgdir/usr/lib/nx/X11/libNX_expat.so.0"

  install -m 644 lib/fontconfig/libNX_fontconfig.so.1.0.4 "$pkgdir/usr/lib/nx/X11/libNX_fontconfig.so"
  ln -s libNX_fontconfig.so "$pkgdir/usr/lib/nx/X11/libNX_fontconfig.so.1.0.4"
  ln -s libNX_fontconfig.so "$pkgdir/usr/lib/nx/X11/libNX_fontconfig.so.1"

  install -m 644 lib/fontenc/libNX_fontenc.so.1.0 "$pkgdir/usr/lib/nx/X11/libNX_fontenc.so"
  ln -s libNX_fontenc.so "$pkgdir/usr/lib/nx/X11/libNX_fontenc.so.1.0"
  ln -s libNX_fontenc.so "$pkgdir/usr/lib/nx/X11/libNX_fontenc.so.1"

  install -m 644 lib/freetype2/libNX_freetype.so.6.3.7 "$pkgdir/usr/lib/nx/X11/libNX_freetype.so"
  ln -s libNX_freetype.so "$pkgdir/usr/lib/nx/X11/libNX_freetype.so.6.3.7"
  ln -s libNX_freetype.so "$pkgdir/usr/lib/nx/X11/libNX_freetype.so.6"

# MK: why does it install another version of libXcomp? (part of nxcomp package, too)
  install -m 644 ../nxcomp/libXcomp.so.3.5.0 "$pkgdir/usr/lib/nx/X11/libXcomp.so"
  ln -s libXcomp.so "$pkgdir/usr/lib/nx/X11/libXcomp.so.1"

  install -m 644 lib/X11/xlibi18n/im/ximcp/libximcp.so.2 "$pkgdir/usr/lib/nx/X11/libximcp.so"
  ln -s libximcp.so "$pkgdir/usr/lib/nx/X11/libximcp.so.2"

  install -m 644 lib/X11/xlibi18n/lc/def/libxlcDef.so.2 "$pkgdir/usr/lib/nx/X11/libxlcDef.so"
  ln -s libxlcDef.so "$pkgdir/usr/lib/nx/X11/libxlcDef.so.2"

  install -m 644 lib/X11/xlibi18n/lc/Utf8/libxlcUTF8Load.so.2 "$pkgdir/usr/lib/nx/X11/libxlcUTF8Load.so"
  ln -s libxlcUTF8Load.so "$pkgdir/usr/lib/nx/X11/libxlcUTF8Load.so.2"

  install -m 644 lib/X11/xlibi18n/lc/gen/libxlibi18n.so.2 "$pkgdir/usr/lib/nx/X11/libxlibi18n.so"
  ln -s libxlibi18n.so "$pkgdir/usr/lib/nx/X11/libxlibi18n.so.2"

  install -m 644 lib/X11/xlibi18n/lc/xlocale/libxlocale.so.2 "$pkgdir/usr/lib/nx/X11/libxlocale.so"
  ln -s libxlocale.so "$pkgdir/usr/lib/nx/X11/libxlocale.so.2"

  install -m 644 lib/X11/xlibi18n/om/generic/libxomGeneric.so.2 "$pkgdir/usr/lib/nx/X11/libxomGeneric.so"
  ln -s libxomGeneric.so "$pkgdir/usr/lib/nx/X11/libxomGeneric.so.2"

  ln -s ../../../libX11.so.6 "$pkgdir/usr/lib/nx/X11/Xinerama/libNX_X11.so.6"
  ln -s ../../../libXext.so.6 "$pkgdir/usr/lib/nx/X11/Xinerama/libNX_Xext.so.6"
  ln -s ../libNX_Xinerama.so "$pkgdir/usr/lib/nx/X11/Xinerama/libXinerama.so"
  ln -s ../libNX_Xinerama.so.1 "$pkgdir/usr/lib/nx/X11/Xinerama/libXinerama.so.1"

# MK: some old stuff.
#  install -m 644 lib/font/stubs/libfntstubs.a "$pkgdir/usr/lib/nx/X11/libfntstubs.a"
#  install -m 644 lib/freetype2/libNX_freetype.a "$pkgdir/usr/lib/nx/X11/libNX_freetype.a"
#  install -m 644 lib/oldX/libNX_oldX.a "$pkgdir/usr/lib/nx/X11/libNX_oldX.a"
#  install -m 644 lib/font/libNX_Xfont.a "$pkgdir/usr/lib/nx/X11/libNX_Xfont.a"
#  install -m 644 lib/font/libNX_Xfont.so.1.5 "$pkgdir/usr/lib/nx/X11/libNX_Xfont.so.1.5"
#  ln -s libNX_Xfont.so.1.5 "$pkgdir/usr/lib/nx/X11/libNX_Xfont.so"
#  ln -s libNX_Xfont.so.1.5 "$pkgdir/usr/lib/nx/X11/libNX_Xfont.so.1"

  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 "CHANGELOG" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG-X11.DEBIAN"
  install -m 644 "../doc/changelog" "${pkgdir}/usr/share/doc/${pkgname}/changelog.DEBIAN"
  install -m 644 "../doc/README.NX-redistributed" "${pkgdir}/usr/share/doc/${pkgname}/README.NX-redistributed"

  install -m 755 -d "$pkgdir/usr/share/nx"
  install -m 644 programs/Xserver/Xext/SecurityPolicy "$pkgdir/usr/share/nx"

  install -m 755 -d "$pkgdir/etc/ld.so.conf.d/"
  install -m 644 "$srcdir/nx-x11.ld.so.conf.d" "$pkgdir/etc/ld.so.conf.d/nx.conf"
}


md5sums=('f2ec60c7e2d81bef2f7292d2b33681a6'
         'a2011e034a318016cf2260c30a567301')
