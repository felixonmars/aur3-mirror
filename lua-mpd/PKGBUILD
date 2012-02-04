# Contributor: Zsolt Udvari <udvzsolt@gmail.com>

pkgname=lua-mpd
pkgver=20100410
pkgrel=1
pkgdesc="MPD client written in Lua, using luasocket"
arch=("any")
url="http://hg.kaworu.ch/lua-mpd"
license=("custom")
source=("http://hg.kaworu.ch/lua-mpd/raw-file/1472054583a8/mpd.lua" "LICENSE")
md5sums=("bc49d4cf8053b87fd4265c9f4527cfe5" "ebb21e3f355771aac118612a7cdc5321")
depends=("luasocket")

build() {
  install -d ${pkgdir}/usr/share/lua/5.1
  install -d ${pkgdir}/usr/share/licenses/lua-mpd

  install -m644 ${srcdir}/mpd.lua ${pkgdir}/usr/share/lua/5.1
  install -m644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/lua-mpd
}
