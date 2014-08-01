# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=gtk2-theme-industrial
pkgver=0.6.5_126.3
pkgrel=1
pkgdesc="Industrial metatheme from OpenSuSE"
arch=(any)
url=http://software.opensuse.org/package/$pkgname
license=(GPL2)
depends=(gtk-engines industrial-icon-theme)
options=(!emptydirs)
source=(http://download.opensuse.org/repositories/GNOME:/Next/openSUSE_Factory/src/gtk2-metatheme-industrial-${pkgver//_/-}.src.rpm)
sha256sums=('511609fbb9ac7d420c30d3fb2f72bee3772a80951f0a8f11fcc02c34928b47c0')
sha512sums=('d2a1f2c87e208a8843b5892d386d05e2b0eab180fdb783f4499cdfb52b626a0dab0300e308520c34d777f136b3bc1388f7c0aa3951504534dc0cfac27ca847ba')

build() {
    bsdtar -xf metatheme-industrial-${pkgver%_*}.tar.bz2
    cd metatheme-industrial-${pkgver%_*}/
    ./configure --prefix=/usr
    make
}

package() {
    make -C metatheme-industrial-${pkgver%_*} DESTDIR="$pkgdir" install
}
