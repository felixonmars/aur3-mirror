# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=naspro-bridges
pkgver=0.5.0
pkgrel=1
pkgdesc="A collection of bridges to LV2 which allow you to use plugins developed for other plugin standards in LV2 hosts."
arch=('i686' 'x86_64')
url="http://naspro.sourceforge.net/"
license=('LGPL')
groups=('naspro')
depends=("naspro-bridge-it>=$pkgver" 'alsa-lib' 'lv2')
makedepends=('dssi' 'ladspa')
optdepends=('ladspa: lapspa bridges'
            'dssi: dssi bridges')
options=('!libtool')
source=("http://download.sourceforge.net/project/naspro/naspro/$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('cfd0ebf647d97d302d8eb8725323a27b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
