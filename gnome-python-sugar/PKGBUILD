# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=gnome-python-sugar
_gpdver=2.30.0
_gpver=2.22.3
pkgver=0.88.0
pkgrel=1
pkgdesc="Gnome Python Bindings limited to librairies needed by Sugar"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
options=('!libtool')
depends=('intltool' 'pygtk>=2.13.0' 'librsvg' 'libwnck' 'gconf' 'evince')
conflicts=('gnome-python-desktop' 'gnome-python')
provides=('gnome-python-desktop' 'gnome-python')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/gnome-python-desktop/2.30/gnome-python-desktop-${_gpdver}.tar.bz2
        http://ftp.gnome.org/pub/gnome/sources/gnome-python/2.22/gnome-python-${_gpver}.tar.bz2
        wscript.patch)
md5sums=('a6d448d46a6b3062ce7a1b6a9fddfb48'
         'ab12d94954a57de39b25eb7903d8429c'
         '4d4fdf50ffeae04e3c3a422639670148')
build() {
  # GConf python bindings
  cd "${srcdir}/gnome-python-${_gpver}"
  ./waf configure --prefix=/usr --enable-module gconf || return 1
  ./waf build ${MAKEFLAGS} || return 1
  ./waf install --destdir="${pkgdir}" || return 1
  
  # rsvg and wnck python bindings
  cd "${srcdir}/gnome-python-desktop-${_gpdver}"
  patch -p0 -i "${srcdir}/wscript.patch"
  PKG_CONFIG_PATH=$PKG_CONFIG_PATH:${pkgdir}/usr/lib/pkgconfig \
    ./waf configure --prefix=/usr --enable-modules rsvg,wnck,evince || return 1
  ./waf build ${MAKEFLAGS} || return 1
  ./waf install --destdir="${pkgdir}" || return 1
  
  # Cleaning
  cd "${pkgdir}/usr"
  rm -rf include
  rm -rf share/gtk-doc
  rm -rf lib/python2.6/site-packages/gtk-2.0/gnomeprint
  rm share/pygtk/2.0/argtypes/bonobo-arg-types.py
  rm share/pygtk/2.0/defs/{printui,print}.defs
}
