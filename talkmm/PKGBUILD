
# Contributor: imagelife <lovelinux229@gmail.com>
pkgname=talkmm
pkgver=0.10
pkgrel=1
pkgdesc="gtalk in linux base on libjingle"
arch=('i686' 'x86_64')
url="http://code.google.com/p/talkmm/"
license=('GPL')
depends=('gtkmm' 'libsexymm' 'libglademm' 'ilbc' 'speex' 'linphone')
source=(http://talkmm.googlecode.com/files/$pkgname-$pkgver.tar.bz2
        http://talkmm.googlecode.com/files/libjingle-0.4.1.tar.bz2 
        http://git.frugalware.org/repos/frugalware-stable/source/lib-extra/libjingle-tapioca/gcc43.patch)
md5sums=('9206ba9da89bfc0260606abbbd620bfa'
         '861ce0390d7409c5af29b09ee34c6df7'
         '0eff38be5eb5cb9ea706a7c3add314ea')

build() {
  #libjingle 
  tar xvf "$srcdir/libjingle-0.4.1.tar.bz2" || return 1
  cd "$srcdir/libjingle-0.4.1"
  patch -p0 -i "$srcdir/gcc43.patch"
  ./configure
  make

  #talkmm 
  cd "$srcdir/$pkgname-$pkgver"
  ln -fs "$srcdir/libjingle-0.4.1/talk" "$srcdir/$pkgname-$pkgver/src" || return 1
  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
