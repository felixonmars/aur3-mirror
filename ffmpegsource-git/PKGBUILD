pkgname=ffmpegsource-git
pkgver=2.18.0.ec0ef9c
pkgrel=1
pkgdesc="An FFmpeg based source library and Avisynth/Vapoursynth plugin for easy frame accurate access (GIT version)"
url="https://github.com/FFMS/ffms2"
arch=('x86_64' 'i686')
license=('MIT')
depends=('ffmpeg')
makedepends=('git' 'automake' 'yasm')
provides=('ffmpegsource')
conflicts=('ffmpegsource')
options=('!libtool')

source=('ffmpegsource::git://github.com/FFMS/ffms2')
md5sums=('SKIP')
_gitname="ffmpegsource"

pkgver() {
  cd "${_gitname}"
  echo "$(./version.sh)"."$(git describe --always)"
}

build() {
  cd "${_gitname}"
  ./configure --prefix=/usr --enable-shared --disable-static --enable-avresample
  make
}

package() {
  cd "${_gitname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/ffmpegsource-svn/license.txt"
}
