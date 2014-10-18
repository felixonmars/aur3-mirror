# 
# 
# 

pkgnamebase=cairo
pkgname=$pkgnamebase-nvidia
pkgver=1.14.0
pkgrel=1
pkgdesc="Cairo vector graphics library, patched for buggy nvidia drivers"
arch=(i686 x86_64)
license=('LGPL' 'MPL')
url="http://cairographics.org/"
depends=('libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman>=0.28.0' 'glib2' 'mesa' 'libgl' 'lzo')
makedepends=('libgl' 'librsvg' 'gtk2' 'poppler-glib' 'libspectre' 'gtk-doc' 'valgrind')
             # for the test suite:
             #'ttf-dejavu' 'gsfonts' 'xorg-server-xvfb' ) # 'libdrm')
#optdepends=('xcb-util: for XCB backend') # really needed?
provides=('cairo-xcb' 'cairo')
replaces=('cairo-xcb' 'cairo')
conflicts=('cairo-xcb' 'cairo')
source=(http://cairographics.org/releases/$pkgnamebase-$pkgver.tar.xz
        cairo-1.10.0-buggy_gradients.patch)
sha1sums=('53cf589b983412ea7f78feee2e1ba9cea6e3ebae'
          '8b843a9934e5112b6188e5bcf4adfc1fdaf9fa04')

prepare() {
  cd $pkgnamebase-$pkgver
  patch -Np1 -i $srcdir/cairo-1.10.0-buggy_gradients.patch
  autoreconf -vfi
}

build() {
  cd $pkgnamebase-$pkgver

  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--disable-static \
	--disable-lto \
	--enable-tee \
	--enable-gl \
	--enable-egl \
	--enable-svg \
	--enable-ps \
	--enable-pdf \
	--enable-gobject \
        --enable-gtk-doc
	
	#--disable-xlib-xcb \
	#--enable-test-surfaces \ takes ages
	#--enable-drm # breaks build
	
  make
}

#check() {
#  cd $pkgnamebase-$pkgver
  #make -j1 -k test || /bin/true
  
  # results:
  # 1.12.8-1	# 162 Passed, 328 Failed [  8 crashed, 10 expected], 26 Skipped
  # 1.12.12-2:	#  29 Passed, 464 Failed [460 crashed,  2 expected], 26 Skipped
  # 1.12.16-1:	# 144 Passed, 364 Failed [  6 crashed, 12 expected], 27 Skipped
#}

package() {
  cd $pkgnamebase-$pkgver
  make DESTDIR="$pkgdir" install
}
