# Contributor: Ryan Corder <ryanc@greengrey.org>
# Maintainer: M Rawash <mrawash@gmail.com>

pkgname=desktop-data-model
pkgver=1.2.5
pkgrel=1
pkgdesc="Desktop Data Model (ddm) is a common component for all Online-Desktop programs (Mugshot, BigBoard and Online-desktop)"
arch=(i686 x86_64)
license=('GPL')
url="http://developer.mugshot.org"
depends=('pcre' 'sqlite3' 'dbus' 'empathy' 'loudmouth')
source=(http://ftp.gnome.org/pub/gnome/sources/desktop-data-model/1.2/desktop-data-model-${pkgver}.tar.bz2)
md5sums=('23a5c7c64df1f796170d8b72201af1ab')

build() {
    cd ${startdir}/src/$pkgname-$pkgver
    ./configure --prefix=/usr --with-x \
                --with-gconf-schema-file-dir=/usr/share/gconf/schemas
    make || return 1
    make DESTDIR=${startdir}/pkg install
}
