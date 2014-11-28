# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=buzztrax-git
pkgver=0.9.0.r3946.b1cd42a
pkgrel=1
pkgdesc="A modular, free, open source music studio that is conceptually based on Buzz (former Buzztard)"
arch=('i686' 'x86_64')
url="http://www.buzztrax.org/"
license=('LGPL')
depends=('gst-buzztrax-git' 'clutter-gtk' 'libgsf' 'desktop-file-utils')
makedepends=('git' 'intltool' 'gtk-doc')
optdepends=('buzzmachines-git: buzz machines collection')
provides=('buzztard' "buzztrax=$pkgver")
conflicts=('buzztard' 'buzztrax' 'buzztrax-svn' 'bsl')
replaces=('buzztard-git' 'buzztrax-svn' 'bsl')
options=('!strip')
install="$pkgname.install"
source=("$pkgname::git+https://github.com/Buzztrax/buzztrax.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  echo $(awk -F '[][]' '/AC_INIT/{print $4}' configure.ac).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd $pkgname
  ./autogen.sh
  ./configure --prefix=/usr \
              --enable-static=no \
              --enable-debug \
              --disable-schemas-compile
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" install

  # delete unneeded cache files
  rm -f "$pkgdir/usr/share/applications/mimeinfo.cache"
  find "$pkgdir/usr/share/mime" -maxdepth 1 -type f -exec rm {} \;
}
