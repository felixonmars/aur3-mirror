# Contributor: Vladimir Korsun <korsun.vladimir@gmail.com>
pkgname=kopete-antispam
pkgver=0.5
pkgrel=2
pkgdesc="Kopete Antispam Plugin helps to protect kopete messenger from various spammers by using simple answer/question scheme"
url="http://www.kde-apps.org/content/show.php/Kopete+Antispam+Plugin?content=82959"
depends=('kdenetwork-kopete')
makedepends=('cmake automoc4')
license=('gpl')
source=(http://downloads.sourceforge.net/sourceforge/kopeteantispam/$pkgname-kde4-$pkgver.tar.gz)
arch=('i686 x86_64')
md5sums=('3f3baa3f86af69ca8246eef60e419fd0')

build() {
    cd $startdir/src/$pkgname-kde4-$pkgver
    cmake -DCMAKE_INSTALL_PREFIX=/usr
    make || return 1
    make DESTDIR=$startdir/pkg install
}