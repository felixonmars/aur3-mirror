# Contributor: Xyne <xyne at archlinux dot us>

pkgname=nexuiz-client-svn
pkgver=5
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="The latest svn client for Nexuiz"
url="http://www.nexuiz.com/"
license="GPL"
depends=('nexuiz-data')
makedepends=('subversion')
source=(nexuiz-dedicated-svn nexuiz-glx-svn nexuiz-sdl-svn nexuiz-glx-svn.desktop nexuiz-sdl-svn.desktop nexuiz.png)
md5sums=('288bac86c33cc72a002c10a57824a30e'
         '19fa224f51dfb5e375c3cb1367505b11'
         '625c3b99c0818c761b680d9a0ed25e66'
         '173420b35cd6a9a1726b57b3569ff476'
         'f3bd7fe2cc26b850e7e3aea8204126ab'
         '442fb62670bbe0a1b5370461052051a3')


build() {
  svn co svn://svn.icculus.org/twilight/trunk/darkplaces $srcdir
  [ 1 ] && pkgver=$(svn info $srcdir | grep Revision | cut -d ' ' -f2)
  cd $srcdir
  make CPUOPTIMIZATIONS="${CFLAGS}" DP_LINK_TO_LIBJPEG=1 cl-nexuiz || return 1
  make CPUOPTIMIZATIONS="${CFLAGS}" DP_LINK_TO_LIBJPEG=1 sdl-nexuiz || return 1
  make CPUOPTIMIZATIONS="${CFLAGS}" DP_LINK_TO_LIBJPEG=1 sv-nexuiz || return 1

  install -D $srcdir/nexuiz-glx $pkgdir/opt/nexuiz/nexuiz-glx-svn || return 1
  install -D $srcdir/nexuiz-sdl $pkgdir/opt/nexuiz/nexuiz-sdl-svn || return 1
  install -D $srcdir/nexuiz-dedicated $pkgdir/opt/nexuiz/nexuiz-dedicated-svn || return 1

  install -D $srcdir/nexuiz-glx-svn $startdir/pkg/usr/bin/nexuiz-glx-svn || return 1
  install -D $srcdir/nexuiz-sdl-svn $startdir/pkg/usr/bin/nexuiz-sdl-svn || return 1
  install -D $srcdir/nexuiz-dedicated-svn $startdir/pkg/usr/bin/nexuiz-dedicated-svn || return 1

  install -Dm644 $startdir/src/nexuiz-glx-svn.desktop $startdir/pkg/usr/share/applications/nexuiz-glx-svn.desktop || return 1
  install -Dm644 $startdir/src/nexuiz-sdl-svn.desktop $startdir/pkg/usr/share/applications/nexuiz-sdl-svn.desktop || return 1
  install -Dm644 $srcdir/nexuiz.png $pkgdir/usr/share/pixmaps/nexuiz.png || return 1
}
