# Contributor: shamrok <szamrok@gmail.com>

pkgname=kio_p7zip
pkgver=0.3.1
pkgrel=4
pkgdesc="A KDE kioslave for 7zip archives"
url="http://kde-apps.org/content/show.php?content=17829"
depends=('kdebase' 'p7zip')
source=(http://kde-apps.org/CONTENT/content-files/17829-$pkgname-$pkgver.tar.bz2)
md5sums=('a88eedc539b01b737b6720ea4d6a9514')
arch=(i686)
license="GPL"

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure
  make || return 1
  make DESTDIR=$startdir/pkg install
  rm $startdir/pkg/opt/kde/share/mimelnk/application/x-7z.desktop
}
