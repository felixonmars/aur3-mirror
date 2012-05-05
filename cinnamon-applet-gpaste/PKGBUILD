# Maintainer: Ner0

pkgname=cinnamon-applet-gpaste
pkgver=1.1
pkgrel=2
pkgdesc="A clipboard management applet for Cinnamon"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/applets/view/27"
license=('GPL')
groups=('cinnamon-applets')
depends=('cinnamon' 'gpaste-daemon')
source=('http://cinnamon-spices.linuxmint.com/uploads/applets/YUMQ-34KQ-0LVR.zip')
md5sums=('fdda5f858a93dd1d370019c48fe95d2a')

package() {
  find gpaste\@dmo60.de -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/cinnamon/applets/{}" \;
}
