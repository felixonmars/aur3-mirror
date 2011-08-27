# $Id: PKGBUILD,v 1.2 2006/01/26 02:39:54 paul Exp $
# Contributor: Paul Mattal <paul@mattal.com>
# Maintainer: Paul Mattal <paul@archlinux.org>
# Contributor: Krzysztof Raczkowski <raczkow@gmail.com>

pkgname=imwheel-enchanced
pkgver=1.0.0pre12
pkgrel=4
pkgdesc="Mouse Wheel Tool for XFree86/Xorg - with extra support for more than 9 buttons"
url="http://imwheel.sourceforge.net"
license=('GPL')
arch=(i686 x86_64)
depends=('libxtst' 'libxmu')
conflicts=('imwheel')
provides=('imwheel')
backup=(etc/X11/imwheel/imwheelrc)
source=(http://prdownloads.sourceforge.net/sourceforge/imwheel/imwheel-$pkgver.tar.gz \
	http://ftp.debian.org/debian/pool/main/i/imwheel/imwheel_$pkgver-8.diff.gz \
	imwheel-$pkgver-enable-extra-buttons-by-default.patch)
md5sums=('21d81db739ae95d96f9b650f7b826a14'
         'cb25c97e6816de76fac23562d52c0a79'
         '6ca918747e148737e6aaccd49558bf89')

build() {
  # patch to fix buggy location of ETCDIR
  cd $startdir/src
  patch -Np0 -i imwheel_1.0.0pre12-8.diff || return 1
  patch -Np0 -i imwheel-1.0.0pre12-enable-extra-buttons-by-default.patch ||return 1
  
  cd $startdir/src/imwheel-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  
  # install default config file
  # (removed by debian patches)
  install -D -m644 $startdir/src/imwheel-$pkgver/imwheelrc $startdir/pkg/etc/X11/imwheel/imwheelrc
}
