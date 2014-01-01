pkgname=wxgtk3.0
_hash=75ef80751d31d6a49afb23017cb7f158d812b562
pkgver=3.0.0.75ef80751d
pkgrel=1
pkgdesc="GTK+ implementation of wxWidgets API for GUI"
arch=('i686' 'x86_64')
url="http://wxwidgets.org"
license=('custom:wxWindows')
depends=('libnotify' 'gstreamer0.10-base' 'webkitgtk' 'libjpeg-turbo')
makedepends=('gstreamer0.10-base-plugins' 'gconf' 'unzip')
optdepends=('webkitgtk3: for webview support')
options=('!emptydirs')
source=(wxWidgets-${_hash}.zip::https://github.com/wxWidgets/wxWidgets/archive/${_hash}.zip
        #http://downloads.sourceforge.net/wxwindows/wxWidgets-${pkgver}.tar.bz2
        wxGTK-3.0.0-collision.patch)
sha1sums=('1f06b1a00b25b1327c2e61a3f166b11dda5755a8'
          #'756a9c54d1f411e262f03bacb78ccef085a9880a'
          'be3c6a6c252b2d7c09634eec7962683b9ebc5b61')

prepare() {
  #cd wxWidgets-${pkgver}
  cd wxWidgets-${_hash}
  patch -p1 -i ../wxGTK-3.0.0-collision.patch
}

build() {
  #cd wxWidgets-${pkgver}
  cd wxWidgets-${_hash}
  ./configure --prefix=/usr --libdir=/usr/lib --with-gtk=3 --with-opengl --enable-unicode \
    --enable-graphics_ctx --enable-mediactrl --enable-webview --with-regex=builtin \
    --with-libpng=sys --with-libxpm=sys --with-libjpeg=sys --with-libtiff=sys \
    --disable-precomp-headers \
    --enable-stl
  make
  make -C locale allmo
}

package() {
  #cd wxWidgets-${pkgver}
  cd wxWidgets-${_hash}
  make DESTDIR="${pkgdir}" install
  install -D -m644 docs/licence.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
