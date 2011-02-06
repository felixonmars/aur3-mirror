# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>
# Maintainer: Mario Blättermann <mariobl@gnome.org>

pkgname=gdm-arc-colors
pkgver=2.7
pkgrel=2
pkgdesc="Arc-Colors GDM theme"
arch=('i686' 'x86_64')
url="http://gnome-colors.googlecode.com/"
license=('GPL')
depends=('gdm-old')
conflicts=('gdm-arc-colors-userlist')
provides=('gdm-arc-colors-userlist')
source=(http://ftp.de.debian.org/debian/pool/main/a/arc-colors/arc-colors_2.7.orig.tar.gz)
md5sums=('5de3eb43963f331d8407ca653082598c')

build() {
    cd "${srcdir}/arc-colors-${pkgver}"
    make DESTDIR="${pkgdir}" install 
}

