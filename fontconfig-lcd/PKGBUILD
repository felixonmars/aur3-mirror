# Maintainer: Arkham <arkham at archlinux dot us>
# Contributor: Manuel "ekerazha" C. (www.ekerazha.com)

pkgname=fontconfig-lcd
pkgver=2.8.0
pkgrel=1
pkgdesc="A library for configuring and customizing font access (custom LCD filter)."
arch=('i686' 'x86_64')
url="http://www.fontconfig.org/"
license=('Public domain')
depends=('fontconfig>=2.8.0')
install=$pkgname.install
source=(10-lcd-filter.conf)
md5sums=('4e21cf72bfa4a5d59529cdced622ce25')

build() {
    install -Dm 644 $srcdir/10-lcd-filter.conf  \
        $pkgdir/etc/fonts/conf.avail/10-lcd-filter.conf || return 1
}
