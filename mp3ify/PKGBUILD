# Contributor: Carlos Pita <carlosjosepita@gmail.com>

pkgname=mp3ify
pkgver=0.1
pkgrel=1
pkgdesc="Converts directory structures with a lot of audio formats to mp3"
url="https://wiki.archlinux.org/index.php/Convert_Any_To_Mp3"
arch=('i686' 'x86_64')
license=('GPL')
depends=('lame' 'mutagen' 'mplayer')
provides=('mp3ify')

build() {
  mkdir -p ${pkgdir}/usr/bin
  cp ../mp3ify ${pkgdir}/usr/bin
}
