# Contributor: Mal Haak <insanemal@gmail.com>
pkgname=quark-git
pkgver=20101130
pkgrel=1
pkgdesc="Quark is a simple \"anti-gui\" music player using xine-lib"
arch=('i686' 'x86_64')
url="http://hsgg.github.com/quark/"
license=('GPL')
depends=('xine-lib>=1.0' 'gtk2>=2.0' 'gconf>=2.0' 'gnome-vfs>=2.0')


_gitroot="git://github.com/hsgg/quark.git"


build() {

msg "Connecting to GIT server..."
  if [[ -d $srcdir/$pkgname-$pkgver ]]; then
    cd $srcdir/$pkgname-$pkgver && git pull origin || return 1
  else
    git clone $_gitroot $srcdir/$pkgname-$pkgver || return 1
    cd $srcdir/$pkgname-$pkgver
  fi

  msg "GIT checkout done or server timeout"

  autoreconf -i
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install

}

