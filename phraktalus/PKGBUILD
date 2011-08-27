#contributor Matías J. Rossi <matiasjrossi@gmail.com>
pkgname=phraktalus
pkgver=0.8rc.r01
pkgrel=1
pkgdesc="Fractal Terrain Generator and Viewer"
arch=('i686' 'x86_64')
license=('GPL')
url=(http://code.google.com/p/phraktalus)
source=('http://phraktalus.googlecode.com/files/phraktalus-0.8rc.r01-src.tar.gz')
md5sums=('1558be5a3e191f148ef506f4e6953e4d')
depends=('qt' 'libgl' 'hicolor-icon-theme' 'libstdc++5')
build()
{
    cd ${startdir}/src/$pkgname-$pkgver
    qmake
    make || return 1
    ./install.sh ${startdir}/pkg/usr || return 1
}


