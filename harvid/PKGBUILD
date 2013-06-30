# Maintainer: speps <speps dot aur dot archlinux dot org>

pkgname=harvid
pkgver=0.7.3
pkgrel=1
pkgdesc="HTTP Ardour Video Daemon"
arch=('i686' 'x86_64')
url="http://x42.github.io/harvid/"
license=('GPL')
depends=('ffmpeg' 'libpng')
source=("https://github.com/x42/harvid/archive/v$pkgver.tar.gz")
md5sums=('b3bab06d3f7c315a9fe638d1d246c757')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # prevent GNU executable stack
  CFLAGS+=" -Wl,-znoexecstack"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # bin
  install -Dm755 src/$pkgname \
    "$pkgdir/usr/bin/$pkgname"

  # ffmpeg and ffprobe symlinks (for ardour)
  ln -s ffmpeg "$pkgdir/usr/bin/ffmpeg_harvid"
  ln -s ffprobe "$pkgdir/usr/bin/ffprobe_harvid"

  # man
  install -Dm644 doc/$pkgname.1 \
    "$pkgdir/usr/share/man/man1/$pkgname.1"

  # doc
  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/$pkgname/README"
}
