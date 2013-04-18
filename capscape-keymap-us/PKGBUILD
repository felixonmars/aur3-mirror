# Maintainer: Wesley Merkel <ooesili@gmail.com>

pkgname=capscape-keymap-us
pkgver=20130414
pkgrel=1
pkgdesc="A US keymap where capslock and escape are switched"
arch=('any')
url="https://github.com/ooesili/capscape"
license=('GPL')
depends=('kbd')
source=(us-capscape.map.gz)
noextract=(us-capscape.map.gz)
md5sums=('b359d82ba0ab57e70157b2177ccc88d2')

package() {
    cd $srcdir
    install -D -m644 us-capscape.map.gz ${pkgdir}/usr/share/kbd/keymaps/i386/qwerty/us-capscape.map.gz
}
