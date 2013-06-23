# Maintainer: Diego Principe <cdprincipe@at@gmail@dot@com>

pkgname=qbittorrent-bin
pkgver=3.0.9
pkgrel=1
pkgdesc="A bittorrent client written in C++ / Qt4 using the good libtorrent library (Ubuntu prebuilt)"
url="http://www.qbittorrent.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt4' 'libtorrent-rasterbar' 'boost-libs' 'openssl>=1.0.0')
optdepends=('python: needed for search'
            'geoip: improves peer country resolution')
conflicts=('qbittorrent' 'qbittorrent-dev' 'qbittorrent-git' 'qbittorrent-nogui-git' 'qbittorrent-nogui')
provides=("qbittorrent=$pkgver")
install=$pkgname.install

if [[ $CARCH = "x86_64" ]]; then
  source=('https://launchpadlibrarian.net/141980482/qbittorrent_3.0.x-0%7E4287-20130608%7Eraring1_amd64.deb')
else
  source=('https://launchpadlibrarian.net/141965810/qbittorrent_3.0.x-0%7E4287-20130608%7Eraring1_i386.deb')
fi

if [[ $CARCH = "x86_64" ]]; then
  md5sums=('2b6431298b990c7cfad90d8779be3978')
else
  md5sums=('4e40bcda978d4feff2b541ce10b9c46e')
fi



package() {
  tar -xf data.tar.gz -C "$pkgdir/"

  cd "$pkgdir/usr/bin"

  _boost=$(strings ./qbittorrent | grep libboost)
  _my_boost=$(pacman -Ql boost-libs | grep -o libboost_system.so.'[0-9].*')
  _raster=$(strings ./qbittorrent | grep libtorrent-rasterbar.so)
  _my_raster=$(pacman -Ql libtorrent-rasterbar | grep -o libtorrent-rasterbar.so.'[0-9]' | head -n1)

  if [[ "$_boost" != "$_my_boost" ]]; then
    sed -i "s/$_boost/$_my_boost/g" ./qbittorrent
  fi

  if [[ "$_raster" != "$_my_raster" ]]; then
    sed -i "s/$_raster/$_my_raster/g" ./qbittorrent
  fi
}
