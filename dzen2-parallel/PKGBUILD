# $Id: PKGBUILD 27711 2010-09-27 09:27:49Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Mark Taylor <skymt0@gmail.com>

pkgname=dzen2
pkgver=0.8.5
source=(http://gotmor.googlepages.com/$pkgname-$pkgver.tar.gz dzen.profile)
pkgname=dzen2-parallel
pkgrel=9
arch=(i686 x86_64)
pkgdesc="X notification utility, packaged so it can run simultaneously with dzen2-svn"
url="http://gotmor.googlepages.com/dzen"
license=("MIT")
depends=('libx11' 'libxpm' 'libxinerama' 'libxft')
makedepends=('gcc')
optdepends=('dzen2-xft-xpm-xinerama-svn: an awesome version that you should use')
md5sums=('5978620c2124c8a8ad52d7f17ce94fd7'
         'd32d8c3e5c8a211fb48a9e6db0bfa6b6')

build()
{
  cd $srcdir/dzen2-$pkgver

  patch -p0 config.mk <<EOF
22,23c22,23
< LIBS = -L/usr/lib -lc -L\${X11LIB} -lX11
< CFLAGS = -Os \${INCS} -DVERSION=\\"\${VERSION}\\"
---
> #LIBS = -L/usr/lib -lc -L\${X11LIB} -lX11
> #CFLAGS = -Os \${INCS} -DVERSION=\\"\${VERSION}\\"
34,35c34,35
< #LIBS = -L/usr/lib -lc -L\${X11LIB} -lX11 -lXinerama -lXpm
< #CFLAGS = -Os \${INCS} -DVERSION=\\"\${VERSION}\\" -DDZEN_XINERAMA -DDZEN_XPM
---
> LIBS = -L/usr/lib -lc -L\${X11LIB} -lX11 -lXinerama -lXpm `pkg-config --libs xft`
> CFLAGS = -Os \${INCS} -DVERSION=\\"\${VERSION}\\" -DDZEN_XINERAMA -DDZEN_XPM -DDZEN_XFT `pkg-config --cflags xft`
EOF

  sed -i "s/CFLAGS = /CFLAGS = ${CFLAGS} /" config.mk

  make X11INC=/usr/include X11LIB=/usr/lib || return 1
  make PREFIX=/opt/dzen MANPREFIX=/opt/dzen/man DESTDIR=$pkgdir install || return 1
  install -m644 -D LICENSE $pkgdir/opt/dzen/COPYING
  install -m644 -D README.dzen $pkgdir/opt/dzen/README.dzen
  install -m755 -D help $pkgdir/opt/dzen/help.sh
  install -m755 -D ../dzen.profile $pkgdir/etc/profile.d/dzen.sh

  cd $srcdir/dzen2-$pkgver/gadgets
  sed -i "s/CFLAGS = /CFLAGS = ${CFLAGS} /" config.mk
  make X11INC=/usr/include X11LIB=/usr/lib || return 1
  make PREFIX=/opt/dzen MANPREFIX=/opt/dzen/man DESTDIR=$pkgdir install || return 1
}
