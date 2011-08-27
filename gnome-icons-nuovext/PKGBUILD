# Maintainer: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: twosouls82 <twosouls82@gmail.com>

pkgname=gnome-icons-nuovext
pkgver=1.7
pkgrel=2
pkgdesc="A chique iconset for the GNOME desktop"
arch=('any')
url="http://nuovext.pwsp.net/"
license=('GPL')
depends=('gnome-desktop>=2.24.1')
source=(http://nuovext.pwsp.net/files/nuoveXT-$pkgver.tar.gz)
md5sums=('991b3d554847569feca947f21feefdef')

build() {
    find -type f -exec chmod 644 {} \;

    install -d $pkgdir/usr/share/icons
    cp -rf nuoveXT-$pkgver/ $pkgdir/usr/share/icons/nuovext/
}
