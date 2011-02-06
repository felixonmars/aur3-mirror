# Maintainer: DonVla <donvla@users.sourceforge.net>
# Contributor: vEX
# Contributor: Ralf Barth <archlinux dot or at haggy dot org>

pkgname=xbmc-skin-rapier
pkgver=3.06
pkgrel=7
pkgdesc="Rapier skin for XBMC"
arch=('i686' 'x86_64')
url="http://xbmc.org/forum/showthread.php?t=58103"
depends=('xbmc')
makedepends=('unzip')
groups=('multimedia')
license=('GPL')
source=('http://fc06.deviantart.net/fs70/f/2010/003/c/c/Rapier___XBMC_by_tvnca.zip' 'addon.xml' 'icon.png')
md5sums=('241de4d064ed7f7aa6af249ade592337'
         '49cee41fb85834058e57d6778ec95286'
         '43cc6dd6f0a262123fbe527b67fdd431')
sha256sums=('888ebcca26a8c6b10fe6a3e9506f51b4a9166533b04547da7001f18922983d55'
            'b8f567e61b7f8416fc2aa0baf3d493b6d63ed0d1f512fea1fef625002842b7a3'
            '96a6e74fc6f8591791e9a98f83fcbdbf984119bd0d34aa7f7c4547fdc1de383e')

build() {
    mkdir -p ${pkgdir}/usr/share/xbmc/addons/skin.rapier
    cp -r ${srcdir}/Rapier/* ${pkgdir}/usr/share/xbmc/addons/skin.rapier
    install -v ${srcdir}/addon.xml ${pkgdir}/usr/share/xbmc/addons/skin.rapier
    install -v ${srcdir}/icon.png ${pkgdir}/usr/share/xbmc/addons/skin.rapier
    find ${pkgdir}/usr/share/xbmc/addons/ -type f -exec chmod 644 '{}' \;
    find ${pkgdir}/usr/share/xbmc/addons/ -type d -exec chmod 755 '{}' \;

    mkdir -p ${pkgdir}/opt/xbmc/skin/ && cd ${pkgdir}/opt/xbmc/skin/
    ln -s ../../../usr/share/xbmc/addons/skin.rapier ./Rapier
}
