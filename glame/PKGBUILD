# Contributor: farid abdelnour <farid at atelier-lab.org>
pkgname=glame
pkgver=2.0.2
pkgrel=1
pkgdesc="Supports non destructive multitrack editing, recording and mixing; realtime effects using native or LADSPA plugins; OSS, ALSA or SGI audio and WAV, Mp3 and Ogg file formats."
arch=('686' 'x86_64')
url="http://glame.sourceforge.net"
license=('GPL')
depends=('guile' 'libvorbis' 'lame' 'libmad' 'fftw2' 'libgnomeui')
source=(http://downloads.sourceforge.net/glame/glame-2.0.2-rc1.tar.gz)
md5sums=(2333d14a93204ab354f74adbe1c75a48)

build() {
  cd $startdir/src/$pkgname-$pkgver-rc1
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}

