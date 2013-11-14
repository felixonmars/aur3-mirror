# Contributer: giacomogiorgianni@gmail.com 

pkgname=tunein-radio-vlc
_name=Tunein-Radio-VLC
pkgver=1
pkgrel=2
#code=9075a50
pkgdesc="This is a Service Discovery LUA Script to TuneIn Radio for VLC 2.X.X"
arch=('any')
url="https://github.com/diegofn/TuneIn-Radio-VLC"
license=('GPL')
categories=()
depends=('vlc>=2' 'lua')
makedepends=(git)
install=${pkgname}.install
source=("https://github.com/diegofn/TuneIn-Radio-VLC/archive/master.zip" "$pkgname.install")

md5sums=(258529ed27b4f724189fada73426e5f1 2d3f63cf26204b8cf643950885820a93)

build() {
  unzip master.zip
  cd ${srcdir}/TuneIn-Radio-VLC-master
  mkdir -p $pkgdir/$HOME/.local/share/vlc/lua/sd
  
  install -m 0775 ./tunein.lua $pkgdir/$HOME/.local/share/vlc/lua/sd/
  cp -pR ${srcdir}/TuneIn-Radio-VLC-master/playlist $pkgdir/$HOME/.local/share/vlc/lua 
  cp -pR ${srcdir}/TuneIn-Radio-VLC-master/resources $pkgdir/$HOME/.local/share/vlc/lua 
echo "		ATTENZION!!!!!! insert user and password variables --> tunein.lua "
}
