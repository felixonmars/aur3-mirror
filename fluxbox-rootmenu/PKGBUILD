# Contributor: Travis <tesjo1@gmail.com>

# $Id: PKGBUILD,v 1.18 2007/10/30 02:50:24 eric Exp $
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor:  John Proctor <jproctor@prium.net>

pkgname=fluxbox-rootmenu
pkgver=1.0.0
pkgrel=1
pkgdesc="Fluxbox as in extra but with support for rootmenu in toolbar."
arch=('i686' 'x86_64')
url="http://www.fluxbox.org"
license=('MIT')
depends=('libxft' 'libxpm' 'libxinerama' 'libxrandr' 'gcc-libs' 'bash' 'imlib2')
makedepends=('pkgconfig')
conflicts=('fluxbox')
provides=('fluxbox')
source=(http://downloads.sourceforge.net/sourceforge/fluxbox/fluxbox-$pkgver.tar.bz2 \
        fluxbox.desktop \
        ToolFactory.rootmenu.patch)
md5sums=('990e276ead0d04421dce4080f485caca' 'eeae9c88a2526ac0bd8afcd9ce97f9ed' 'e88eae641499eb0969d76e8bdf9f4efb')
sha1sums=('7985e35fbb170fda24b9e04610690cd04c7a8748' 'f3f83b8ce84d79c2f8670ef687e0dd89ab0552b8' '534b589bfb97d7154a80cbe85cf100679eea630c')

build() {
  cd $startdir/src/fluxbox-${pkgver}
  # add rootmenu support for toolbar
  patch -Np0 -i $startdir/ToolFactory.rootmenu.patch || return 1
  ./configure --prefix=/usr \
   --enable-kde --enable-gnome \
   --enable-xft --enable-xinerama \
   --enable-imlib2 --enable-nls
  make || return 1
  make DESTDIR=$startdir/pkg install
 # this is a fix to allow fluxbox to shutdown, but this can be changed by the user :-(
  sed -i 's|^.*slit\.autoHide.*$|session.screen0.slit.autoHide:  True|' \
    $startdir/pkg/usr/share/fluxbox/init
  install -D -m644 ../fluxbox.desktop \
    $startdir/pkg/etc/X11/sessions/fluxbox.desktop
  install -D -m644 COPYING $startdir/pkg/usr/share/licenses/fluxbox/COPYING
}
