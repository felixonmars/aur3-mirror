# Maintainer: Florian Léger <florian dot leger at insa dash rouen dot fr>

pkgname=soundfont-personalcopy
pkgver=5.1f
pkgrel=1
pkgdesc="A large free SoundFont."
arch=(any)
license=("custom")
url="http://www.personalcopy.com"
groups=('soundfonts')
md5sums=('4dea28956700d4da74f0b8d3e76779e8')
source=(ftp://ftp.personalcopy.net/pub/PC${pkgver/./}.sf2.gz)
build() {
  cd $startdir/src
  install -D -m644 PC${pkgver/./}.sf2 $startdir/pkg/usr/share/soundfonts/PC${pkgver/./}.sf2
}

