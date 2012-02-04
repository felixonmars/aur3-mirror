# Maintainer: leepesjee < lpeschier at xs4all dot nl >
pkgname=galan
pkgver=0.3.0beta7
_pkgver=0.3.0_beta7
pkgrel=3
pkgdesc="A modular synthesiser - drum-machine - sequencer - effects-unit for Linux and Win32"
arch=('i686' 'x86_64')
options=('!libtool')
url="http://galan.sourceforge.net/"
license=('GPL')
depends=('liblrdf' 'libvorbis' 'jack' 'esd' 'gtk2')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${_pkgver}.tar.gz
        galan.desktop
        galan-logo.png)
md5sums=('a68c95ae708c6925d78b81d9ca1c85f3'
         'd3912b903377521825306fe83f25eeca'
         '0bf6df5378378af1920f5d9b7ffaddd6')

build() {
  cd ${startdir}/src/${pkgname}-${_pkgver}
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1

  install -d -m755 $pkgdir/usr/include/galan
  install -m644 ./include/*.h $pkgdir/usr/include/galan
  cp ./doc/examples $pkgdir/usr/share/galan -R
  install -D -m644 ${startdir}/galan-logo.png $pkgdir/usr/share/pixmaps/galan-logo.png
  install -D -m644 ${startdir}/galan.desktop $pkgdir/usr/share/applications/galan.desktop
}
