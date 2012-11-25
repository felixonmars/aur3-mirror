# Contributor: Luis Pablo Gasparotto <lpgasparotto(at)gmail(dot)com>

pkgname=distrho-wolpertinger
pkgver=20120518
pkgrel=1
pkgdesc="Wolpertinger is a subtractive, antialiased polyphonic software synthesizer, now working as a LV2 plugin."
url="http://distrho.sourceforge.net/"
arch=('x86_64')
license=('GPL')
depends=('lv2' 'p7zip')
source=(http://sourceforge.net/projects/distrho/files/Ports/Wolpertinger/wolpertinger_linux64_20120518.7z)
md5sums=('1e43154a39c877eab4b24161fe6c0763')
build() {
  cd $startdir/src/wolpertinger_linux64
  install -m 755 -d $startdir/pkg/usr/lib/lv2/Wolpertinger.lv2
  install -m 644 -D lv2/Wolpertinger.lv2/* $startdir/pkg/usr/lib/lv2/Wolpertinger.lv2/
}
