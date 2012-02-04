# Maintainer: Frank Scheffold <fscheffold@googlemail.com>

pkgname=pidgin-visnotes
pkgver=0.2
pkgrel=1
pkgdesc="Plugin which integrates pidgin notifactions more in kde"
arch=('i686' 'x86_64')
url="http://www.kde-apps.org/content/show.php/VisualNotifications+for+Pidgin?content=118256"
license=('GPL')
depends=('pidgin' 'kdebase-runtime' 'dbus-glib')
source=(http://kde-apps.org/CONTENT/content-files/118256-pidgin-visnotes-0.2.tar.gz)
md5sums=('243291b098b187f0cdacce5cc61924c1')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}

