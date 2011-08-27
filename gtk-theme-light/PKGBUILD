# Contributor: wido <widomaker2k7@gmail.com>
# Contributor: gtklocker <karanti.linux _at_ googlemail _dot_ com>

pkgname=gtk-theme-light
pkgver=0.1.8.4
pkgrel=1
pkgdesc="The new Ubuntu 10.04 default theme"
arch=('any')
depends=('humanity-icons' 'gtk-engine-murrine' 'ubuntu-mono' 'gconf')
conflicts=('light-themes')
url="https://launchpad.net/light-themes"
license=('CCPL')
source=(https://launchpad.net/ubuntu/natty/+source/light-themes/${pkgver}/+files/light-themes_${pkgver}.tar.gz)
md5sums=('3e6b48e02d22ce284a21cd702cab9cc1')

package() {
    install -d $pkgdir/usr/share/themes
    cp -r ${srcdir}/light-themes/{Ambiance,Ambiance-CSD,Radiance} "$pkgdir"/usr/share/themes
}
