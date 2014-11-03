pkgname=ttf-lemurika
pkgdesc='Playful comic theme by Insane Machina'
pkgver=1.0
pkgrel=4
depends=(fontconfig xorg-font-utils)
arch=(any)
source=("http://img.dafont.com/dl/?f=lemurika")
md5sums="47e4bcfbba9847f49e49a48915536317"
url=("http://insanemachina.com/")
license=('GPL')
install=$pkgname.install

package() {
   mkdir -p $pkgdir/usr/share/fonts/TTF
   cp Lemurika.ttf $pkgdir/usr/share/fonts/TTF
}
