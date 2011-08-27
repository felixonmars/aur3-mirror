# Contributor: Mika Hynnä <mika d hynna at iki d fi>
# Maintainer: Mika Hynnä <mika d hynna at iki d fi>
pkgname=pupdatenotifier
pkgver=0.2
pkgrel=1
pkgdesc="An update notifier and update installer for Arch Linux (pacman)."
arch=(i686 x86_64)
url="http://kapsi.fi/ighea/pudatenotifier/"
license=('GPL')
install=('pupdatenotifier.install')
depends=('python' 'pygtk' 'pygobject' 'sudo' 'pacman')
optdepends=('pynotify: for notification support')
source=(http://kapsi.fi/ighea/$pkgname/$pkgname-$pkgver.tar.gz)

build() {
  cd ${srcdir}/${pkgname}/
  make PREFIX=/usr DESTDIR=${pkgdir} install
}
md5sums=('b247c3481eb1bdecf90947c071ba1e82')
md5sums=('38a7fe6233eb524ca6599af868529ec2')
