# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=wxpython2.9-light
pkgver=2.9.5.0
pkgrel=1
pkgdesc="A wxWidgets GUI toolkit for Python (GNOME/GStreamer free!) (2.9 branch)"
arch=('i686' 'x86_64')
license=('custom:wxWindows')
url="http://www.wxpython.org"
depends=('wxgtk2.9-light' 'python2-opengl' 'python2-cairo')
makedepends=('mesa')
source=("http://downloads.sourceforge.net/wxpython/wxPython-src-${pkgver}.tar.bz2"
        'fix.patch')
md5sums=('a2a28fe8223391c93bf8788316767c9e'
         '69a6b60ad9b0a91adbe293477eda70b8')

prepare() {
  rm -fr wxPython-build
  mv "wxPython-src-${pkgver}" wxPython-build
  cd wxPython-build

  patch -p1 -i "${srcdir}/fix.patch"

  find . -type f -exec sed -i 's/env python/env python2/' {} \;
}

build() {
  cd "${srcdir}/wxPython-build"
  ./configure --prefix=/usr --libdir=/usr/lib --with-{gtk=2,libjpeg=sys,libpng=sys,libtiff=sys,libxpm=sys,regex=sys,opengl,sdl} --enable-{unicode,graphics_ctx} --disable-{optimize,mediactrl,precomp-headers}
  cd wxPython
  python2 setup.py WXPORT=gtk2 UNICODE=1 BUILD_GLCANVAS=1 build
}

package() {
  cd "${srcdir}/wxPython-build/wxPython"
  python2 setup.py WXPORT=gtk2 UNICODE=1 BUILD_GLCANVAS=1 install --root="${pkgdir}"
  install -D -m644 ../docs/licence.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Prevent collisions
  mkdir -p "${pkgdir}/usr/bin/temp"
  cd "${pkgdir}/usr/bin"
  for i in $(find . -type f); do mv ${i} "${pkgdir}/usr/bin/temp/${i}-2.9"; done
  mv "${pkgdir}/usr/bin/temp/"* "${pkgdir}/usr/bin"
  rm -fr "${pkgdir}/usr/bin/temp"

  mv "${pkgdir}/usr/lib/python2.7/site-packages/wx.pth" "${pkgdir}/usr/lib/python2.7/site-packages/wx-2.9.pth"
  mv "${pkgdir}/usr/lib/python2.7/site-packages/wxversion.py" "${pkgdir}/usr/lib/python2.7/site-packages/wxversion-2.9.py"
  mv "${pkgdir}/usr/lib/python2.7/site-packages/wxversion.pyc" "${pkgdir}/usr/lib/python2.7/site-packages/wxversion-2.9.pyc"
}