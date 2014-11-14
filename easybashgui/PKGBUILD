# Maintainer:
 
pkgname=easybashgui
pkgver=10.0.0
pkgrel=1
pkgdesc="Create bash GUIs without worrying about running environment"
arch=(any)
url="https://sites.google.com/site/$pkgname"
license=('GPL3')
optdepends=('dialog: dialog support'
            'kdebase-kdialog: kdialog support'
            'xdialog: xdialog support'
            'zenity: zenity support')
install=$pkgname.install
source=("https://github.com/BashGui/$pkgname/archive/$pkgver.tar.gz")
md5sums=('c3f19c5a9db6e32a33dc86e850bdaf95')

package() {
   cd ${pkgname}-${pkgver}

   msg2 "Running make install.."
   make DESTDIR="${pkgdir}" install
}