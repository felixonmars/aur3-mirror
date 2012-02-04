# Maintainer: Daenyth <Daenyth+Arch [at] gmail [dot] com>
# Contributor: Jarosla Lichtblau <dragonlord@aur.archlinux.org>

pkgname=audiotag
pkgver=0.19
pkgrel=1
pkgdesc="A command-line tool for mass tagging/renaming of audio files."
arch=('i686' 'x86_64')
url="http://github.com/Daenyth/audiotag/"
license=('GPL')
depends=('flac' 'vorbis-tools' 'id3lib' 'perl' 'atomicparsley')
source=(http://github.com/Daenyth/audiotag/tarball/v$pkgver)

md5sums=('cf2c59209a00d406cf79b921f6a5f026')

build() {
  cd "${srcdir}/Daenyth-${pkgname}-"*

  install -D -m755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
