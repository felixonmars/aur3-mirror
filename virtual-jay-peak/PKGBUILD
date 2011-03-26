# Maintainer: Arnaud Durand-Favreau <biginoz at FREE point FR>


pkgname=virtual-jay-peak
pkgver=1.1a
pkgrel=3
pkgdesc="Virtual Jay Peak is a simulation of snowboarding at the Jay Peak resort in Vermont."
arch=('i686')
url="http://soulride.com/products/jay_peak.html"
license=('GPL')
depends=('sdl_image' 'sdl_mixer' 'sdl_ttf' 'sdl_sound')
source=(http://soulride.com/products/images/virtual_jay_peak_linux_1_1a.tar.gz jay-peak jay-peak.png jay-peak.desktop)
install=('virtual-jay-peak.install')
md5sums=('ad71057a223e3dfc1ba55f8ff94693bb'
         '04ff87146ef1df772f86455b5da673c3'
         '491b02252624a0cbd5ab0e52e5dd0aba'
         '7c9b03b157a655b4f1974602ed278956')



package() {

  cd $startdir/src/soulride
  install -d $startdir/pkg/usr/bin && \
  install -d $startdir/pkg/usr/share/soulride && \
  install -m 755 -o 0 -g 0 ../jay-peak $startdir/pkg/usr/bin
  cp -r * $startdir/pkg/usr/share/soulride
  install -D -m644 $srcdir/jay-peak.desktop $pkgdir/usr/share/applications/jay-peak.desktop
  install -D -m644 $srcdir/jay-peak.png $pkgdir/usr/share/pixmaps/jay-peak.png
}
