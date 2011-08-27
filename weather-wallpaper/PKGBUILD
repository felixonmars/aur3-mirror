#Contributor: Kessia 'even' Pinheiro <kessiapinheiro at gmail.com>
#Contributor: Angel 'angvp' Velasquez <angvp [at] archlinux.com.ve> 
pkgname=weather-wallpaper
pkgver=0.2.0
pkgrel=4
pkgdesc="Creates a wallpaper with the current weather"
arch=('i686' 'x86_64')
url="http://mundogeek.net/weather-wallpaper/"
license=('GPL2')
depends=('pymetar' 'pygtk' 'inkscape' 'imagemagick')
source=("http://launchpadlibrarian.net/17362202/weather-wallpaper_0.2.0-1.tar.gz"
        'weather-wallpaper.patch')
md5sums=('55af67aaeb383a1d1f0932cef6b06038'
         '1547821d30ce54b0936febc8ff76b856')

build() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   patch -Np0 -i ${srcdir}/weather-wallpaper.patch || return 1
   make DESTDIR=${pkgdir} install || return 1
}
