# Maintainer: ValHue <vhuelamo_at_gmail_dot_com>

pkgname=cinnamon-applet-messaging-menu
pkgver=1.1.1
pkgrel=1
pkgdesc="This is a Cinnamon applet, which lets you access your Messaging Icons through an icon in the cinnamon panel."
url="http://cinnamon-spices.linuxmint.com/applets/view/24"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('cinnamon')
source=("http://cinnamon-spices.linuxmint.com/uploads/applets/J0P2-QWG4-Y6XZ.zip")
md5sums=('5e5569e617df325a9c4b70d5097937fb')

package() {
    find MessagingMenu\@bownz -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/cinnamon/applets/{}" \;
}
