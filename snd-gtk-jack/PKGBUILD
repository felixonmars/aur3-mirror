# Maintainer: Corey Mwamba <contact.me@coreymwamba.co.uk>

pkgname=snd-gtk-jack
_pkgname=snd
pkgver=15
pkgrel=1
epoch=1
pkgdesc="A sound editor, with JACK and GTK+ enabled"
arch=('i686' 'x86_64')
url="http://ccrma.stanford.edu/software/snd/"
license=('custom')
depends=('fftw' 'gsl' 'gtk3' 'jack')
makedepends=('ladspa')
provides=('snd-ls' 'snd')
conflicts=('snd-ls' 'snd')
source=(ftp://ccrma-ftp.stanford.edu/pub/Lisp/$_pkgname-$pkgver.tar.gz)
md5sums=('fb52ed6374b9afab3e391e248896a807')

build() {
  cd $srcdir/$_pkgname-$pkgver
  ./configure --prefix=/usr --without-oss --without-pulseaudio --without-portaudio --with-jack --with-ladspa
  make LIBS="-lm -ldl -lpthread"

}

package() {
  cd $srcdir/$_pkgname-$pkgver
   make prefix=$pkgdir/usr install
  rm -f $pkgdir/usr/share/$_pkgname/*.{fs,rb}
  install -D -m 644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

