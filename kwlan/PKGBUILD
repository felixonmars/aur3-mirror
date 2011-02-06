#Contributor : ViNS <gladiator.at.fastwebnet.at.it>

pkgname=kwlan
pkgver=0.6.3
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Network manager for kde"
url='http://www.kde-apps.org/content/show.php?content=37041'
license="GPL"
depends=('dhclient' 'wpa_supplicant' 'kde-meta-kdebase') # the creator did not mention any dep, but a working KDE should be fine
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('878f4a81aed8db736a6a89b4aa12e781')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/kde --without-arts --enable-sudo #cannot find the missing lib (for --without-arts) write a comment if you do
  make || return 1
  make DESTDIR=$startdir/pkg install
}
