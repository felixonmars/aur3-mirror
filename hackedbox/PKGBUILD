# $Id: PKGBUILD,v 1.11 2006/06/04 21:33:19 simo Exp $
# Maintainer: dale <dale@archlinux.org>
# Contributor Zap <ghv@netsons.org>

pkgname=hackedbox
pkgver=0.8.5
pkgrel=1
pkgdesc="A stripped down version of the Blackbox window manager"
arch=(i686 x86_64)
url="http://scrudgeware.org/projects/Hackedbox"
license=('GPL')
depends=('libxext' 'libsm' 'gcc-libs')
conflicts=('openbox')
source=(http://scrudgeware.org/downloads/$pkgname/$pkgname-$pkgver.tar.gz \
        	hackedbox-0.8.5-gcc43.patch)
md5sums=('7de3d0c76598f2e3d7e59cceb058c201'  '21c634008ef9e2daea47c46e4401e666')         
build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 < ../hackedbox-0.8.5-gcc43.patch

  ./configure --prefix=/usr --disable-nls --enable-keybindings \
      --enable-bg-utils 
  make || return 1
  make DESTDIR="$pkgdir" install
}
# vim: ts=2 sw=2 et ft=sh
