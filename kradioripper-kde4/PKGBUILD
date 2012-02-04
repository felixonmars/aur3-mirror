# Contributor: bgmiki
pkgname=kradioripper-kde4
pkgver=0.5
pkgrel=1
pkgdesc="KDE4.xx app for ripping internet radio"
arch=('i686' 'x86_64')
depends=( 'streamripper'  'qt' 'bzip2' 'libxft')
makedepends=('cmake' 'automoc4')
url="http://www.kde-apps.org/content/show.php/KRadioRipper?content=78068"
license=('GPL')
source=(http://garr.dl.sourceforge.net/sourceforge/kradioripper/kradioripper-0.5.tar.bz2)
md5sums=('c59016660379eb623ebca8dbe2914504')

build() {
  cd $startdir/src/kradioripper

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
   make || return 1
   make DESTDIR=$startdir/pkg install || return 1
}

# vim:set ts=2 sw=2 et: