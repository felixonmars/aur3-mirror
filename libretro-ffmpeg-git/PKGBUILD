# Maintainer: Modeler <dantootill at gmail dot com>

pkgname=libretro-ffmpeg-git
pkgver=2014.06.23_n2.0_9613_ga1bdc01
pkgrel=1
pkgdesc="Video player implemented in libretro."
arch=('i686' 'x86_64' 'arm' 'armv6h')
url="https://github.com/libretro/libretro-ffmpeg"
license=('LGPLv2, GPLv2')
makedepends=('git' 'ffmpeg')
depends=('ffmpeg')
_gitname=libretro-ffmpeg

source=("git+https://github.com/libretro/FFmpeg"
        "https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/ffmpeg_libretro.info")
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd FFmpeg
  echo "$(git log -1 --format="%cd" --date=short | sed 's|-|.|g')_$(git describe --always | sed 's/-/_/g')"
}

build() {
  cd FFmpeg/libretro
  make
}

package()
{
  install -Dm644 "FFmpeg/libretro/ffmpeg_libretro.so" "$pkgdir/usr/lib/libretro/libretro-ffmpeg.so"
  install -Dm644 "ffmpeg_libretro.info" "${pkgdir}/usr/lib/libretro/libretro-ffmpeg.info"
}

