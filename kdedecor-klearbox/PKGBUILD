# Contributor: Jesus Franco <jesusfranco@gmail.com>

pkgname=kdedecor-klearbox
pkgver=1.0
pkgrel=1
pkgdesc="Inspired by Clearbox Metacity theme generator"
url="http://kde-look.org/content/show.php?content=30935"
license="GPL"
depends=('kdebase' 'kdelibs')
source=(http://www.kde-look.org/content/files/30935-KlearBox.tar.gz)
md5sums=('8fcf9334681d715ce8eaea0a6db5d1e2')

build() {
        cd $startdir/src/KlearBox
        ./configure --disable-debug --prefix=/opt/kde
        make || return 1
        make DESTDIR=$startdir/pkg install
}