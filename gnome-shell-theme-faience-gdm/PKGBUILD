# Maintainer: Harv Chen <ch05042210[at]gmail[dot]com>
pkgname=gnome-shell-theme-faience-gdm
pkgver=0.3
pkgrel=1
pkgdesc="A GDM theme for gnome-shell-theme-faience"
url="http://tiheum.deviantart.com/art/Gnome-Shell-Faience-255097456"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('gnome-shell' 'gnome-shell-theme-faience')
source=("gdm.css")
md5sums=('0cd8efb1d535c2265857f21cc76a64fa')

build() {
    mkdir -p "${pkgdir}/usr/share/themes/Faience/gnome-shell/"
    cp "${srcdir}/gdm.css" "${pkgdir}/usr/share/themes/Faience/gnome-shell/"
}
