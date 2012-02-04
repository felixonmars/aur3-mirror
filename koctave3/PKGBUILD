# Contributor: DaNiMoTh <jjdanimoth@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Laszlo Papp <djszapi at archlinux us>
pkgname=koctave3
pkgver=0.70
pkgrel=3
pkgdesc="A KDE GUI for octave"
url="http://koctave.sourceforge.net"
license=('GPL')
arch=('i686')
depends=('kdelibs3')
install=koctave.install
source=(http://downloads.sourceforge.net/sourceforge/koctave/koctave-$pkgver.tar.gz)
md5sums=('59d8e684b165a5341f2107370971188d')

build() {
  cd $srcdir/koctave-$pkgver
  ./configure --prefix=/opt/kde --without-arts --disable-rpath
  export KDEDIRS=${pkgdir}/usr:/opt/kde
  # rpath removal
  sed -i 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' libtool
  sed -i 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' libtool
  make || return 1
  make prefix=${pkgdir}/usr install || return 1
}
