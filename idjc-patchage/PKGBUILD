# Contributor: Tobias Luther <tobias [at] tonstrom [dot] de>
# Resambled by Silvio Knizek <killermoehre@gmx.de>

pkgname=idjc-patchage
pkgver=0.8.3
pkgrel=1
pkgdesc='internet dj console shout- and icecast streaming program; uses patchage instead of qjackctl -> no qt dependencies'
arch=(i686 x86_64)
url="http://web.bethere.co.uk/idjc/"
depends=('python' 'jack' 'pygtk' 'lame' 'mutagen' 'flac' 'faad2' 'libsamplerate' 'libshout' 'vorbis-tools' 'libsndfile' 'ffmpeg' 'libmad' 'patchage' 'speex')
makedepends=('pkgconfig')
conflicts=('idjc' 'idjc-latest')
provides=('idjc')
source=("http://garr.dl.sourceforge.net/project/idjc/idjc/0.8/idjc-${pkgver}.tar.gz")
md5sums=('8035fbc2380aa1a8157fca607c1d6d79')
license=('GPLv3')

build() {
	cd $startdir/src/idjc-$pkgver
            ./configure --prefix=/usr CFLAGS="-O2"
              make || return 1
                make DESTDIR=$pkgdir install
        }
