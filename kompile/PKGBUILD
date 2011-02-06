#Contributor: uwolfer <uwolfer @ fwo.ch>

pkgname=kompile
pkgver=0.3_beta2
pkgrel=1
origver=0.3-beta2
pkgdesc="Kompile is a KDE interface for automatic execution of configurations, compilation and installation of source tarballs."
url="http://kde-apps.org/content/show.php?content=30223"
license="GPL"
depends=('kdelibs')
source=(http://www.brainspace.it/files/$pkgname-$origver.tar.bz2)
md5sums=('a2400ae8387e1a16797b4132f3bc0b66')

build() {
        cd $startdir/src/$pkgname-$origver
         ./configure --prefix=/opt/kde
        make || return 1
        make DESTDIR=$startdir/pkg install
}
