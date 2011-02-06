
pkgname=gedit-symbol-browser-plugin
_gname=gedit
_gver=2.30.0
_sver=0.1
pkgver=0.1_2.30
pkgrel=1
pkgdesc="symbol browsing (function browser, class browser, etc.) plugin for Gedit"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gedit' 'ctags-css')
makedepends=('pkgconfig' 'gnome-doc-utils>=0.19.5' 'intltool')
url="http://www.micahcarrick.com/11-14-2007/gedit-symbol-browser-plugin.html"
source=(http://ftp.gnome.org/pub/gnome/sources/${_gname}/2.30/${_gname}-${_gver}.tar.bz2
        http://freefr.dl.sourceforge.net/project/symbol-browser/symbol-browser/${pkgname}/${pkgname}-${_sver}.tar.gz)
sha256sums=('37598473372aab217e46f19726cff616ff0ea4121bbdbb170b4e264a4ca76690'
            '4d368349cf0b5a73c5b6ea44a0383e6454d1dd8145c5aad601203619e318134d')

build() {
  cd "${srcdir}/${_gname}-${_gver}/plugins"
        tar -xzf "${srcdir}/${pkgname}-${_sver}.tar.gz" || return 1

        # EDIT MAKE AND CONFIGURE FILES
    sed -i 's/SUBDIRS =/SUBDIRS = \t\\\n\tsymbolbrowser\t/g' Makefile.am || return 1
    sed -i 's/DIST_SUBDIRS =/DIST_SUBDIRS =\t\\\n\tsymbolbrowser\t/g' Makefile.am || return 1
    cd "${srcdir}/${_gname}-${_gver}" 
    sed -i 's/AC_CONFIG_FILES(\[/AC_CONFIG_FILES(\[\nplugins\/symbolbrowser\/Makefile/g' configure.ac || return 1
 
        # BUILD THE PLUGIN
    autoconf || return 1
    automake || return 1
  ./configure --libexecdir=/usr/lib     || return 1
  
  cd plugins/symbolbrowser 
  make || return 1
  mkdir -p "${pkgdir}/usr/lib/gedit-2/plugins"

  cp symbolbrowser.gedit-plugin .libs/libsymbolbrowser.so  "${pkgdir}/usr/lib/gedit-2/plugins"
  cd symbols
  rm Makefile Makefile.am Makefile.in
  cd ..
  cp -r symbols "${pkgdir}/usr/lib/gedit-2"
}
