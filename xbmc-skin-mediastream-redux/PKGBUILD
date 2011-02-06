# Contributor: Ralf Barth <archlinux dot or at haggy dot org>
# Contributor: Richard Atkinson atkinsonr at gmail

pkgname=xbmc-skin-mediastream-redux
pkgver=1.0
pkgrel=1
pkgdesc="MediaStream Redux skin for XBMC"
arch=('i686' 'x86_64')
url="http://xbmc.org/forum/showthread.php?p=361209"
source=(http://blackbolt.x-scene.com/Jezz_X/MediaStream_Redux_${pkgver}.rar)
depends=('xbmc')
makedepends=('unrar')
provides=()
groups=('multimedia')
license=('GPL')
options=()
md5sums=('2469899cc88a2cb2420e0a6d5788f859')
sha256sums=('0c70e67e7e3d749e743f03a518231dc1835c817cc979c4f530cc5ef05e4f6c60')

build() {
  cd $srcdir 
  unrar x MediaStream_Redux_${pkgver}.rar
  mkdir -p $pkgdir/usr/share/xbmc/skin
  cp -r $startdir/src/MediaStream_Redux $pkgdir/usr/share/xbmc/skin/
}
