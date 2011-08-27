# Contributor: Radoslaw Dominiak <radoslaw.dominiak@gmail.com>

pkgname=kdedecor-powder
pkgver=0.6
pkgrel=1
arch=(i686 x86_64)
pkgdesc="Inspired by some plasmoids mockups. The borders are larger than the usually so thin and unreachable borders --Usability!-- but they don't look so."
url="http://www.kde-look.org/content/show.php?content=29935"
license="GPL"
depends=('kdebase' 'kdelibs')
source=('http://www.kde-look.org/CONTENT/content-files/29935-powder-0.6.tar.bz2')
md5sums=('8904809a571570f141e3260624af5e72')

build() {
        cd $startdir/src/powder-$pkgver
        ./configure --disable-debug --prefix=/opt/kde
        make || return 1
        make DESTDIR=$startdir/pkg install
}