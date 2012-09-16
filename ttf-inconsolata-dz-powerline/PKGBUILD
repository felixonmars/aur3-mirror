pkgname=ttf-inconsolata-dz-powerline
pkgver=1.0
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="Inconsolata-dz-Powerline"
arch=('any')
url=('https://github.com/Ateoto/ttf-inconsolata-dz-powerline')
license=('GPL')
source=(https://gist.github.com/raw/1595572/51bdd743cc1cc551c49457fe1503061b9404183f/Inconsolata-dz-Powerline.otf)
md5sums=(4319abb6691c480d23cec11252c86a56)
install=$pkgname.install

build()
{
    mkdir -p $pkgdir/usr/share/fonts/TTF
    cp $srcdir/Inconsolata-dz-Powerline.otf $pkgdir/usr/share/fonts/TTF
}
