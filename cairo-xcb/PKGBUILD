# Maintainer: xduugu
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Brice Carpentier <brice@daknet.org>

pkgname=cairo-xcb
pkgver=1.12.0
pkgrel=2
pkgdesc="Cairo vector graphics library, xcb backend enabled"
arch=(i686 x86_64)
license=('LGPL' 'MPL')
url="http://cairographics.org/"
depends=('libpng' 'libxrender' 'fontconfig' 'pixman' 'glib2' 'sh' 'xcb-util')
makedepends=('librsvg' 'poppler-glib' 'libspectre') # 'libdrm')
provides=("cairo=$pkgver")
conflicts=('cairo')
options=('!libtool')
source=(http://cairographics.org/releases/${pkgname%-*}-$pkgver.tar.gz
        cairo-1.10.0-buggy_gradients.patch
        git_fixes.patch )
sha1sums=('63e0d1372a7919956b6d959709dfdf35d3cecc02'
          '8b843a9934e5112b6188e5bcf4adfc1fdaf9fa04'
          '9b7e39b55dc660f84e10278e97a456da5869740c')
sha256sums=('af65b766dff11bcf3cba1f92d92a1bc28f78dc2944908a5930a026af06510099'
            '79085147567e6e080d5c1d7d2246f7d4be1efcc8e4b4fe44b6db1ebeae93c420'
            'e953a70d27df8780b658085dbff1ca52e1c227a7fc89ec6794fdbced3efb9567')

build() {
  cd "$srcdir/${pkgname%-*}-$pkgver"
  patch -Np1 -i "$srcdir/cairo-1.10.0-buggy_gradients.patch"
  # status is 2012-04-07 last commit: fix _cairo_pattern_get_ink_extents to work with snapshot recording surfaces
  patch -Np1 -i ${srcdir}/git_fixes.patch
  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--disable-static \
	--enable-tee \
	--disable-xlib-xcb \
	# --enable-test-surfaces \ takes ages
	#--enable-drm # breaks build
  make
}

#check() {
#  cd "$srcdir/${pkgname%-*}-$pkgver"
#  make check || /bin/true # 248 Passed, 65 Failed [2 crashed, 8 expected], 28 Skipped
#}

package() {
  cd "$srcdir/${pkgname%-*}-$pkgver"
  make DESTDIR="$pkgdir" install
}
