# Contributor: Radoslaw Dominiak <radoslaw.dominiak@gmail.com>

pkgname=kdedecor-cylonminimal
pkgver=0.2
pkgrel=1
arch=(i686 x86_64)
pkgdesc="Windeco inspired by the Cylons of the new Battlestar Galactica - Series"
url="http://www.kde-look.org/content/show.php/'CylonMinimal'+Window+Decoration+for+KDE?content=51993"
license="GPL"
depends=('kdebase' 'kdelibs')
source=("http://works13.com/downloads/CylonMinimal-$pkgver.tar.gz")
md5sums=('d544570f4ead244bb6090eaaa31b0944')

build() {

        cd $startdir/src/CylonMinimal-$pkgver
        ./configure --disable-debug --prefix=/opt/kde
        make >/dev/null 2>&1 || return 1
	make || return 1
        make DESTDIR=$startdir/pkg install
}
