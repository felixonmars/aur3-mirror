# Contributor: IgooR <igoor (at) godsgift (dot) de>

pkgname=screen-saver-switch-plasmoid
pkgver=0.2
pkgrel=1
pkgdesc="Lets you quickly enable or disable the screen saver autostart by clicking on the icon."
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/show.php?content=93752"
license=('GPL2')
groups=()
depends=('kdebase-workspace>=4.2')
makedepends=('gcc' 'cmake' 'automoc4')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://www.kde-apps.org/CONTENT/content-files/93752-plasma-applet-screensaverswitch-$pkgver.tar.gz")
noextract=()
md5sums=('633b89423c6b9a8bb4f6b55756f9d71c')
build() {
  cd $srcdir
  cd plasma-applet-screensaverswitch-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr . || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}
