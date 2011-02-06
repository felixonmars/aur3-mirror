# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=stills2dv
pkgver=alpha_0.601
pkgrel=2
pkgdesc="An open source solution to make a movie out of still pictures"
arch=('i686' 'x86_64')
url="http://www.deniscarl.com/stills2dv/"
license=('GPL')
depends=('libjpeg' 'libpng' 'libxext')
optdepends=(
  'ffmpeg: movie creation support (standard or high definition)'
  'libdv: movie creation support (standard definition only)'
  'mplayer: movie creation support (standard or high definition)'
)
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}/$pkgname-${pkgver//_/-}.tgz/download")
md5sums=('8ed69f48d5af651aa70940e64b39c854')
sha1sums=('6800f4c2e37c5764d886a94bad18315a2e171015')
sha256sums=('91e475871ff231ad3a6536ecf75ddc648f1d49d90970dd5d7a125377476046a3')
sha384sums=('52d1141f95471c4f85ed4d6e8116a805bbdaca6cc2df540e031cdbfd9a5a3ca4b15a5f8fd49c6faca506702b92ea2ebb')
sha512sums=('b2e201dadb62d8a9e8005d3308b80efa0f690c37c334451f00a5ac261a242f00ea033ff8c6fa341185b0cc4d9e4bd0f8338e8deec8309f352f624ea2abf4015c')

build() {
  cd "$srcdir/$pkgname-${pkgver//_/-}"
  make
}

package() {
  install -Dm755 "$srcdir/$pkgname-${pkgver//_/-}/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
