# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
pkgname=gwave2
pkgver=20090213
pkgrel=1
pkgdesc="A waveform viewer for the output of analog electronic circuitsimulators like spice/gnucap"
arch=(i686 x86_64)
url="http://gwave.sourceforge.net/"
license=('GPL')

#
# CAUTION: guile-cairo and guile-gnome-platform present in AUR and guile-cairo marks as optional
# depend for guile-gnome-platform but this package can be build only when guile-cairo built
# before guile-gnome-platrorm!
#
depends=('gtk2' 'guile' 'libffi' 'g-wrap' 'guile-lib' 'guile-cairo' 'guile-gnome-platform')

source=(http://downloads.sourceforge.net/project/gwave/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install

  #/bin/install -D -m 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

md5sums=('73059cfbb4e290a4159555bb7f20880b')
