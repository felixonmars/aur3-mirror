# Maintainer:Biginoz < biginoz AT free point fr>
pkgname=wto
pkgver=1.0.7
pkgrel=1
pkgdesc="web tv orange sans firefox et enregistreur en python"
arch=('any')
url="http://wto.tuxfamily.org/downloads"
license=('GPL')
groups=
provides=
depends=( 'python>=2.6' 'pygtk' 'mplayer')
makedepends=
conflicts=
replaces=
backup=
install=
source=(http://download.tuxfamily.org/wto/$pkgname-$pkgver.tar.gz
wto.desktop wto.png)

    
md5sums=('b1bf5f9c8c0f6f79cf019bea6635cff2'
         '2f3b1f83889ccfd35d0f79b8ee146ecc'
         '287a050191d5c92f2f0a5956685ce34a')

build() {
cd $startdir/src/wto-42bb1b0/
 python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1
}
packa() {
cd $startdir/pkg/usr/bin
sed -e "s/\#\!\/usr\/bin\/python/\#\!\/usr\/bin\/python2/g" wto > wto


}
