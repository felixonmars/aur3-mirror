# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# based on:  TDY <tdy@gmx.com>

pkgname=wxgtk-wout-gconf
pkgver=2.9.3
pkgrel=3
pkgdesc="A GTK+ implementation of wxWidgets API for GUI. WITHOUT GCONF"
arch=('i686' 'x86_64')
url="http://wxwidgets.org/"
license=('custom:wxWindows')
depends=('libgl' 'sdl' 'libmspack' 'libxxf86vm' 'libsm')
makedepends=('mesa' 'gstreamer0.10-good-plugins' 'python2' 'cppunit')
provides=('wxgtk-2.9')
source=("http://downloads.sourceforge.net/wxwindows/wxWidgets-"${pkgver}".tar.bz2"
        "configure-wout-gconf.patch")
md5sums=('6b6003713289ea4d3cd9b49c5db5b721'
         'b2d767da148c9b694c96ceae730a043c')
options=('!emptydirs')

build() {
  cd "${srcdir}"
  
  # use python2
  rm -rf "${srcdir}"/python
  mkdir "${srcdir}"/python
  ln -s /usr/bin/python2 "${srcdir}"/python/python
  export PATH="${srcdir}"/python:$PATH

  rm -fr wxWidgets-"${pkgver}"-build
  cp -R  wxWidgets-"${pkgver}" wxWidgets-"${pkgver}"-build
  cd wxWidgets-"${pkgver}"-build
  patch --silent -p0 -E -i "${srcdir}"/configure-wout-gconf.patch
  sed -i 's,/usr/$wx_cv_std_libpath,& /usr/lib,' configure
  ./configure --prefix=/usr --libdir=/usr/lib --with-gtk=2 --with-opengl --without-gnomeprint --enable-graphics_ctx --enable-mediactrl --with-sdl --with-libmspack --enable-stl --disable-compat28
  make
  make -C locale allmo
}

package() {
  cd "${srcdir}"/wxWidgets-"${pkgver}"-build
  make DESTDIR="${pkgdir}" install
  install -Dm644 docs/licence.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE

  # provide compatibility with extra/wxgtk
  ln -sf /usr/lib/wx/config/gtk2-unicode-2.9 "${pkgdir}"/usr/bin/wx-config-2.9
  rm -f "${pkgdir}"/usr/bin/wx-config
  rm -f "${pkgdir}"/usr/bin/wxrc
  rm -rf "${pkgdir}"/usr/share/bakefile
  find "${pkgdir}"/usr/share/locale -name wxmsw.mo -delete
  for _mo in "${pkgdir}"/usr/share/locale/*/LC_MESSAGES/wxstd.mo; do
    mv "${_mo}" "${_mo/wxstd.mo/compat-wxstd29.mo}"
  done
  mv "${pkgdir}"/usr/share/aclocal/wxwin.m4 "${pkgdir}"/usr/share/aclocal/wxwin-2.9.m4
}
