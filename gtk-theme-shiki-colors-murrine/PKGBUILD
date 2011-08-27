# Contributor: Yvan <madridista40@orange.fr>

pkgname=gtk-theme-shiki-colors-murrine
pkgver=4.6
pkgrel=1
pkgdesc="Shiki-Colors GTK+ and Metacity theme (Murrine version)"
arch=('i686' 'x86_64')
url="http://gnome-colors.googlecode.com/"
license=('GPL')
depends=('gtk-engines' 'gtk-engine-murrine>=0.90.3')
conflicts=('gtk-theme-shiki-colors')
source=(http://gnome-colors.googlecode.com/files/shiki-colors-murrine-${pkgver}.tar.gz)
md5sums=('27dba036c2274784190b4d1bbb68120c')

build() {
    cd "${srcdir}"
    make DESTDIR=${startdir}/pkg install
}

