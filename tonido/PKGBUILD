# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=tonido
pkgver=4.79.0.26297
pkgrel=1
pkgdesc="A software and service that can make files and media in your computer available anywhere through a web browser"
arch=(i686 x86_64)
url=http://www.tonido.com
license=(freeware)
depends=(lib32-curl lib32-gtk2 lib32-libjpeg6 lib32-libpng12 lib32-libvorbis lib32-libxml2 lib32-openssl098 lib32-sqlite)
[[ $CARCH == "i686" ]] && depends=(${depends[@]/lib32-/})
source=($pkgname-$pkgver.deb::$url/download.php?TonidoSetup_i686.deb)
sha256sums=('cb8ac93c0c3045120fcbbf5913fbfbc3256a07ab341539e5f1076ff3931a28c9')
sha512sums=('b5b9858390ac6c97277b0edb40a676efa68f7df064861a920a774837b8dd134b14d9465888cd9914f71e836db4d2a21d781c7245c628efdae000ff6dda5b7050')

package() {
    bsdtar -xf data.tar.gz
    sed -i "s:usr/local/$pkgname:usr/share/$pkgname:g" usr/local/$pkgname/*.sh
    install -d "$pkgdir"/usr/share/
    cp -r usr/local/$pkgname/ "$pkgdir"/usr/share/
    chown -R root:root "$pkgdir"
}
