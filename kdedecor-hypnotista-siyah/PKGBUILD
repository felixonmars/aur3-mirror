# Contributor: Jesus Franco <jesusfranco@gmail.com>

pkgname=kdedecor-hypnotista-siyah
pkgver=0.1
pkgrel=1
pkgdesc="This is the Black version of Hypnotista Sade"
url="http://kde-look.org/content/show.php?content=33203"
license="GPL"
depends=('kdebase' 'kdelibs')
source=(http://www.kde-look.org/content/files/33203-Hypnotista_Siyah-0.1.tar.gz)
md5sums=('5b7d24f882013b99d6d2fc2fa00c58e8')

build() {
        cd $startdir/src/Hypnotista_Siyah-$pkgver
        ./configure --disable-debug --prefix=/opt/kde
        make || return 1
        make DESTDIR=$startdir/pkg install
}