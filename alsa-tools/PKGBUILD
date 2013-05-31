# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Sebastien Luttringer <seblu+arch@seblu.net>
# Contributor: Jochen Immendœrfer <jochen.immendoerfer@gmail.com>

pkgname=alsa-tools
pkgver=1.0.27
pkgrel=3
pkgdesc="ALSA tools package"
arch=(i686 x86_64)
url=http://alsa-project.org/
license=(GPL2 GPL3)
depends=(alsa-lib fltk gtk2 gtk3)
options=(!libtool)
source=(http://alsa.cybermirror.org/tools/$pkgname-$pkgver.tar.bz2)
sha256sums=('6562611b5a6560712f109e09740a9d4fa47296b07ed9590cb44139c5f154ada2')
sha512sums=('aad985329e5649b5bd7c142e95c5d1c415f28bac1afb81ad21fedac76e736d18abe4aa129e798650d91b2dd14fb18f3960ed5218768c689319c2360c432b4589')

prepare() {
    cd $pkgname-$pkgver/
    #sed -i '/QT_VER=/ s:include:Qt:g' qlo10k1/configure ## requires Qt3, later
    sed -ri 's:(qlo10k1|seq)::' Makefile
    install -d ld10k1/m4
}

build() {
    cd $pkgname-$pkgver/
    make configure CONFIGURE_ARGS='--prefix=/usr --x-libraries=/usr/lib --bindir=/usr/bin --sbindir=/usr/bin'
    cd seq/sbiload/
    ./configure --prefix=/usr --x-libraries=/usr/lib
    make
}

package() {
    cd $pkgname-$pkgver/
    make DESTDIR="$pkgdir" install
    make -C seq/sbiload/ DESTDIR="$pkgdir" install
}
