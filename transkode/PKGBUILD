# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Lukas Miczka <lukascpu@gmail.com>

pkgname=transkode
pkgver=0.7
pkgrel=4
pkgdesc="A KDE front-end (+amaroK plugin) for various audio transcoding tools"
arch=('i686' 'x86_64')
url="http://transkode.sourceforge.net/"
license=('GPL')
depends=('amarok1' 'taglib')
optdepends=('faac' 'faad2' 'ffmpeg' 'flac' 'gsteamer' 'lame' 'mplayer' 'muse'
            'shorten' 'speex' 'twolame' 'vorbis-tools' 'wavpack' 'xine'
            '*Bonk Audio (http://www.logarithmic.net/pfh/bonk)'
            '*Lossless Audio (http://www.lossless-audio.com/)'
            '*LPAC (http://www.nue.tu-berlin.de/wer/liebchen/lpac.html)'
            '*OptimFROG (http://www.losslessaudio.org/)'
            '*True Audio (http://www.true-audio.com)')
install=$pkgname.install
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2
        $pkgname-$pkgver-gcc44.diff)
md5sums=('a24502b735a4a5567636273bac6c9461'
         '89cf02ba5ae1f92259d965db6b5a9cd0')

build() {
  cd "$srcdir/$pkgname"
  patch -Np1 -i ../$pkgname-$pkgver-gcc44.diff || return 1
  [[ -r /etc/profile.d/qt3.sh ]] && . /etc/profile.d/qt3.sh
  ./configure kde_appsdir='\${datadir}/applications/kde' --without-arts
  make || return 1
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}
