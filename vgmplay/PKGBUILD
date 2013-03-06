# Maintainer: ZekeSulastin <zekesulastin+aur@gmail.com>

pkgname=vgmplay
pkgver=0.40.3
epoch=1
_srcver=040-3
pkgrel=2
pkgdesc="The offical and always up-to-date player for all VGM files"
arch=('i686' 'x86_64')
url="http://vgm.mdscene.net/forum/viewtopic.php?t=112"
source=("http://vgm.mdscene.net/programs/players/VGMPlay_${_srcver}_src.7z"
        "https://github.com/zekesulastin/vgm-player/archive/${pkgver}-${pkgrel}.tar.gz"
		"http://dl.dropbox.com/u/48629685/vgmplay-linux-makestuff.tar.xz")
license=('GPL') # Due to included libs
depends=('zlib' 'sh')
optdepends=("oss: program's native sound system"
            "alsa-oss: ALSA's aoss wrapper"
            "libpulse: PulseAudio's padsp wrapper"
            "ossp: provides OSS emulation via CUSE"
			"unzip: to read downloaded VGM packs")
install='vgmplay.install'
md5sums=('1fb682686463899a269278b9fbfa958c'
         'dc49018cc72344207bf51972e7772ff1'
         '525a0e208e6a468fc3b8fbcbcf2c3735')

build() {
  cd "$srcdir"
  # Quick fix to move binary out of the way of the script while allowing
  #  use of the current config file VGMPlay.ini
  rm makefile
  make -j1
}

package() {
  cd "$srcdir"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  cd "vgm-player-$pkgver-$pkgrel"
  install -D -m755 vgm-player "$pkgdir/usr/bin/vgm-player"
}
