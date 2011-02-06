# Contributor: Jesus Franco <jesusfranco@gmail.com>

pkgname=kdedecor-blended
pkgver=0.3
pkgrel=1
pkgdesc="Requested native KDE version of my Blended theme for deKorator made with DecGen"
url="http://kde-look.org/content/show.php?content=32613"
license="GPL"
depends=('kdebase' 'kdelibs')
source=(http://www.kde-look.org/content/files/32613-Blended-0.3.tar.bz2)
md5sums=('7089c4ae581e3b3f3aff7e8a2d8ec57a')

build() {
        cd $startdir/src/Blended-$pkgver
        ./configure --disable-debug --prefix=/opt/kde
        make || return 1
        make DESTDIR=$startdir/pkg install
}