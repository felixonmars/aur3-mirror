# Contributor:Tutku Dalmaz <tutkudalmaz@gmail.com>
# Maintainer:Laszlo Papp <djszapi2 at gmail com>
pkgname=kpicosim
pkgver=0.7
pkgrel=5
pkgdesc="Environment for the Xilinx PicoBlaze-3 soft-core processor for the KDE Desktop"
arch=('i686')
url="http://www.xs4all.nl/~marksix/index.html"
license=('GPL')
depends=('kdelibs3' 'hicolor-icon-theme')
install=$pkgname.install
source=("http://www.xs4all.nl/~marksix/downloads/$pkgname-$pkgver.tar.gz")
md5sums=('516745ac092e1d3a460232a4f4227897')

build() {
  cd ${srcdir}/${pkgname}
  export KDEDIRS=${pkgdir}/usr:/opt/kde
  ln -sf /usr/bin/aclocal /usr/bin/aclocal-1.9
  ln -sf /usr/bin/automake /usr/bin/automake-1.9
  ./configure --prefix=${pkgdir}/usr --without-arts --with-qt-dir=/opt/qt \
  --with-qt-includes=/opt/qt/includes --with-qt-libraries=/opt/qt/lib \
  --disable-rpath
  # rpath removal
  sed -i 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' libtool
  sed -i 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' libtool
  make || return 1
  make install || return 1
  rm -rf ${pkgdir}/usr/share/doc/HTML/en/kpicosim/common /usr/bin/aclocal-1.9 /usr/bin/automake-1.9
}
