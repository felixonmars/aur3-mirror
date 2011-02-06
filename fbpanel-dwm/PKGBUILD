# Maintainer: Julien Pecqueur <jpec at julienpecqueur dot com>
#
# pkgrel 1 : creation of the pkg
# pkgrel 2 : correction of md5 sum for the new tarball
# pkgrel 3 : update to mainstream (6.1)
# pkgrel 4 : custom height and margin patch added

pkgname=fbpanel-dwm
pkgver=6.1
pkgrel=4
pkgdesc="Hacked version of fbpanel to provide a systray to DWM"
arch=('i686' 'x86_64')
url="http://julienpecqueur.com/"
license=('GPL')
conflicts=('fbpanel' 'fbpanel-fr')
replaces=('fbpanel' 'fbpanel-fr')
source=(http://julienpecqueur.com/pkgs/$pkgname-$pkgver.tar.gz
        custom_height_and_margin.diff)
sha256sums=('ac92e3b0f43157806d2c2c7b46efa01cc145bc8feae0a4765b9cb3715be1a54b'
            'b0895d383597922a20ebbaae3ba90ec8c7ca361d1ee4c25610557f6015243b13')
build() {
  cd $srcdir/$pkgname-$pkgver
  patch -Np1 < $srcdir/custom_height_and_margin.diff || return 1
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
