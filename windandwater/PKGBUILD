# Maintainer: megadriver <megadriver at gmx dot com>

pkgname=windandwater
pkgver=1.05a
pkgrel=3
pkgdesc="Very polished and addictive arcade puzzle game"
arch=('i686')
url="http://www.wind-water.net/"
license=('custom')
depends=('libtremor-svn' 'libpng12' 'sdl_mixer' 'sdl_image' 'sdl_net')
makedepends=('upx')
options=(!strip)
install=$pkgname.install
source=("http://yuanworks.s3.amazonaws.com/wind-water/download/WindAndWater_LINUX_EXE.zip"
        "http://yuanworks.s3.amazonaws.com/wind-water/download/WindAndWater_PC.zip"
         $pkgname.sh $pkgname.desktop)
md5sums=('a8daa30443cda2df076e323374b2072c'
         '22d5a86fadb99475431c37df4506b441'
         '5e185f93e8606a16127596d0a7835186'
         'e5e12316a684549b7bce9faae47de10c')

build() {
    chmod +x WindAndWater
    upx -9 WindAndWater
}

package() {
    install -D -m755 WindAndWater $pkgdir/opt/$pkgname/WindAndWater
    install -m644 WindAndWater.eos* WindAndWater.eplib WindAndWater.png $pkgdir/opt/$pkgname
    chown -R root:games $pkgdir/opt/$pkgname
    chmod -R g+w $pkgdir/opt/$pkgname
    install -D -m755 $pkgname.sh $pkgdir/usr/bin/$pkgname
    install -D -m644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
