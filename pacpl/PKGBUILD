# Maintainer: Xiao-Long Chen
pkgname=pacpl
pkgver=5.0.0
pkgrel=1
pkgdesc="Convert multiple audio types from one format to another. Dolphin/Konqueror Integration."
arch=('any')
url="http://pacpl.sourceforge.net/"
license=('GPL')
# change the first dependency to kdebase-konqueror if you prefer Konqueror
depends=(
  'kdebase-dolphin'
  'perl'
  'perl-parse-recdescent'
  'perl-inline'
  'libogg'
  'flac'
  'perl-ogg-vorbis-header'
  'perl-mp3-info'
  'perl-mp4-info'
  'perl-mp3-tag'
  'perl-audio-wma'
  'perl-audio-flac-header'
  'perl-audio-musepack'
  'cddb_get'
  'vorbis-tools'
  'perl-switch'
  'perl-parallel-forkmanager'
  'perl-cddb'
)
install=${pkgname}.install
source=(
  http://downloads.sourceforge.net/pacpl/${pkgname}-${pkgver}.tar.gz
  https://dl.dropboxusercontent.com/u/4583032/AUR/$pkgname-$pkgver/configure.ac.patch
)
makedeps=(
  'autoconf'
)
sha512sums=('0e8b216d49cb59e3a313704033d19ac80aa41d7090c1a8e6040460520f870b7849ae701c545ce0ffd3b3b8798e6fa7adb5dd763b04b4e1db0be37c0f9d954211'
            'f4df5f3aac876f05b719776ba984e2cc9db9fcbcd33d48eeeda44a6fc80adcc8e82a42263506ba0a59da857b8adb688bf172218b9da2357e51e2848bafdd09df')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch configure.ac ../configure.ac.patch
  autoconf
  ./configure
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rvf ${pkgdir}/usr/share/apps
}
# vim:syntax=sh
