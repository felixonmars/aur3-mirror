# Contributor: Jesus Franco <jesusfranco@gmail.com>

pkgname=kdedecor-hypnotistasade
pkgver=0.1
pkgrel=1
pkgdesc="This theme is inspired of windows vista visual style"
url="http://kde-look.org/content/show.php?content=32946"
license="GPL"
depends=('kdebase' 'kdelibs')
source=(http://www.kde-look.org/content/files/32946-Hypnotista_Sade-0.1.tar.gz)
md5sums=('f88ef0eefae4112ccb8099ae61045745')

build() {
        cd $startdir/src/Hypnotista_Sade-$pkgver
        ./configure --disable-debug --prefix=/opt/kde
        make || return 1
        make DESTDIR=$startdir/pkg install
}