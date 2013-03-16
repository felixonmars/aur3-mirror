#Maintainer: evertonstz
pkgname=nitroslim
pkgver=0.7
pkgrel=3
pkgdesc="Set your desktop wallpaper with nitrogen, this program will put some blur (radius can be changed) and put the wallpaper in your slim theme folder."
url="https://github.com/evertonstz/nitroslim"
arch=('any')
license=('GPLv2')
depends=('imagemagick' 'xorg-xrandr' 'libnotify' 'nitrogen' 'slim' )
optdepends=('slimlock')
source=(https://dl.dropbox.com/u/22297890/nitroslim.tar.gz)
md5sums=('0e49f8cf5d544cd47b04c637d222ac21')

build () {
    install -d ${pkgdir}/usr/local/bin/
    cp ${pkgname} ${pkgdir}/usr/local/bin/${pkgname}
    chmod +x ${pkgdir}/usr/local/bin/${pkgname}
}