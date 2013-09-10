# Maintainer: Chirantan Ekbote <ekbotec at chromium.org>
# Contributor: tri <trile7 at gmail dot com>

pkgname=googsystray
pkgver=1.3.1
pkgrel=2
pkgdesc="Googsystray is a system tray app for Google Voice, GMail, Google Calendar, and Google Reader"
arch=("i686" "x86_64")
url="http://googsystray.sourceforge.net/"
license=('GPL3')
depends=('python2' 'pygtk')
optdepends=('gnome-keyring: manage password in gnome' 'kdeutils-kwallet: manage password in kde')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('437e8f398dc6a11809a066f10d0c0a9f')

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root="${pkgdir}"
  install -D -m644 LICENSES "$pkgdir/usr/share/licenses/$pkgname/LICENSES"
}

