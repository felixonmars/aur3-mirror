# Contributor: Cristian Maureira <saint [at] archlinux.cl>

pkgname=qmetronome
pkgver=0.1
pkgrel=1
pkgdesc="A Qt4-based metronome"
arch=('i686' 'x86_64')
url="http://slist.lilotux.net/linux/${pkgname}/"
license=('GPL3')
depends=('qt>=4' 'pulseaudio')
source=($url/qMetronome-$pkgver.tgz)
md5sums=('f13aed55533e4007a097ee392e1e6305')

build() {
  cd qMetronome-$pkgver

  qmake
  make || return 1
  install -Dm755 qMetronome "$pkgdir"/usr/bin/qMetronome
}

