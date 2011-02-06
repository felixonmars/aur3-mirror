# Maintainer: veox <veox@wre.ath.cx>

pkgname=jacksampler-git
pkgver=20101113
pkgrel=1
pkgdesc="A sampler with JACK MIDI input and JACK audio output"
arch=('i686' 'x86_64')
url="http://space.twc.de/~stefan/jacksampler.php"
license=('LGPL')
depends=('jack' 'beast')
makedepends=('git' 'pkgconfig')
provides=('jacksampler')
conflicts=('jacksampler')
source=()
md5sums=()

_gitroot="http://space.twc.de/public/git/jacksampler.git"

build() {
  msg "Connecting to GIT server..."
  if [[ -d $srcdir/$pkgname-$pkgver ]]; then
    cd $srcdir/$pkgname-$pkgver && git pull origin || return 1
  else
    git clone $_gitroot $srcdir/$pkgname-$pkgver || return 1
    cd $srcdir/$pkgname-$pkgver
  fi
  msg "GIT checkout done or server timeout"

  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
