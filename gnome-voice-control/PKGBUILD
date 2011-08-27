# Contributor: archtux <antonio.arias99999@gmail.com>

pkgname=gnome-voice-control
pkgver=0.4
pkgrel=2
pkgdesc="Application that monitors the audio input from microphone and then executes the desired action over the Gnome Desktop."
arch=('i686' 'x86_64')
url="http://live.gnome.org/GnomeVoiceControl"
license=('GPL')
depends=('libpanelappletmm' 'pocketsphinx>=0.5')
source=(http://download.berlios.de/festlang/$pkgname-$pkgver.tar.gz)
md5sums=('d8f3c9b9a99a32d7182409d0d3677c16')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
  make DESTDIR=$pkgdir install
}
