# Contributor: Alexander Duscheleit <jinks@archlinux.us>

pkgname=mplay
pkgver=1.0rc1
_pkgver=1.0-rc1
pkgrel=2
pkgdesc="A Curses front-end for mplayer."
arch=('any')
url="http://mplay.sourceforge.net"
license=('GPL')
depends=('perl>=5.10.0' 'perl-mp3-info' 'perl-audio-mixer' 'perl-ogg-vorbis-header-pureperl'
         'perl-time-hires' 'perl-term-readkey' 'perl-net-ping-external' 'perl-mp4-info'
         'perl-mp3-tag' 'perl-video-info' 'perl-class-makemethods' 'cutmp3' 'mplayer')
optdepends=('perl-audio-flac-header: FLAC MetaTag support.')
options=(!emptydirs)
install=mplay.install
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${_pkgver}.tar.gz mplay.install)
sha256sums=('993b4c42a9636bb54d7fcf3939a563f53d4092e54423075ed50153f8e7737a44'
            'fbbc36473b5210a3dc6d7709494f6f938abe58539ceb9f6c21f9f00ca456f6ba')

build() {
  cd "$srcdir/$pkgname-$_pkgver"

  sed -i 's:/usr/local:/usr:g' mplay || die "Unable fix the /usr/local path issues."
  sed -i 's:~/.mplay/bin:/usr/bin:' mplay || die "Unable to fix cutmp3 path."

}

package() {
  cd "$srcdir/$pkgname-$_pkgver"

  # shared files
  install -d -m755 $pkgdir/usr/share/$pkgname/config
  install    -m644 help/help_* $pkgdir/usr/share/$pkgname
  install    -m644 files/.Xdefault* $pkgdir/usr/share/$pkgname/config
  install    -m644 files/mplayconf $pkgdir/usr/share/$pkgname/config

  # binaries
  install -D -m755 mplay $pkgdir/usr/bin/mplay
  install -D -m755 files/xmplay $pkgdir/usr/bin/xmplay

  # man page
  gzip -9nf help/mplay.1
  install -D -m644 help/mplay.1.gz $pkgdir/usr/share/man/man1/mplay.1.gz
}
# vim:set ts=2 sw=2 et:
