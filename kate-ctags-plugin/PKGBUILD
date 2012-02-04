# Contributor: Berkus <berkus@madfire.net>
pkgname=kate-ctags-plugin
pkgver=0.2.1
pkgrel=1
pkgdesc="Ctags support plugin for Kate"
arch=(i686)
url="http://www.kde-apps.org/content/show.php?content=47743"
license=('GPL')
depends=(kdebase ctags)
source=(http://home.freeuk.com/cpdrummond/kate-ctags-plugin-0.2.tar.gz http://www.kde-apps.org/CONTENT/content-files/62818-kate-ctags-plugin-0.2.1.patch)
md5sums=('c2b6b2083e3ebeb8d1d47bfe874beab0'
         'ebc5442e637162bb2558abd2c8e9fe80')

build() {
  cd $startdir/src/$pkgname-0.2
  patch -p0 -R -i ../62818-kate-ctags-plugin-0.2.1.patch
  ./configure --prefix=/opt/kde
  make || return 1
  make DESTDIR=$startdir/pkg install
}
