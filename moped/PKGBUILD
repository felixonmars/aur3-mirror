# Contributor: Ben Morgan <uv.sound@gmail.com>
pkgname=moped
pkgver=2.16
pkgrel=7
pkgdesc="An advanced tool to flexibly manipulate MPD playlists"
arch=('any')
url="https://github.com/cassava/Moped"
license=('GPL')
depends=("python>=3.1.2" zenity mpd)
install=moped.install
source=(https://github.com/downloads/cassava/Moped/$pkgname-$pkgver.tar.gz)
md5sums=('8d8eb88d3824e894ab8211c098bd069a')

package() {
  cd $srcdir/$pkgname-$pkgver
  
  mv install.sh.example install.sh
  chmod +x install.sh
  ./install.sh $pkgdir
}
