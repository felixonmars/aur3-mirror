# Mantainer: Franco Tortoriello

pkgname=bin32-dosbox-svn-patched
pkgver=3907
pkgrel=1
pkgdesc="x86 DOS-based PC emulator focused on games, with Glide support (32-bit)"
arch=(x86_64)
url="http://dosbox.sourceforge.net"
license=(GPL)
depends=(lib32-sdl_net lib32-sdl_sound lib32-libpng lib32-openglide-cvs)
makedepends=(gcc-multilib subversion lib32-glu)
install=dosbox-patched.install
provides=(dosbox dosbox-svn dosbox-svn-patched)
conflicts=(dosbox dosbox-svn dosbox-svn-patched)
source=(dosbox::svn+http://svn.code.sf.net/p/dosbox/code-0/dosbox/trunk
	dosbox.png::http://www.dosbox.com/dosbox_wiki.png
	dosbox.desktop
	01-beep.patch		# http://home.arcor.de/h-a-l-9000
	02-ctrlbreak.patch	# http://sourceforge.net/p/dosbox/patches/228
				# http://sourceforge.net/p/dosbox/patches/229
	03-swapstereo.patch	# http://www.vogons.org/viewtopic.php?t=25827
	04-gus-stereo.patch 05-hd-order.patch
				# http://www.vogons.org/viewtopic.php?t=31881
	06-time-stamp.patch	# http://www.vogons.org/viewtopic.php?t=22600
	07-glide.patch		# from http://www.vogons.org/viewtopic.php?t=16462
	)

pkgver() {
  cd "$SRCDEST/dosbox"
  svnversion
}

prepare() {
  cd "$srcdir/dosbox"

  for _f in "$srcdir"/*.patch; do
    msg2 "Applying $_f"
    patch -p1 -i "$_f"
  done
}

build() {
  cd "$srcdir/dosbox"

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  linux32 ./autogen.sh
  linux32 ./configure --prefix=/usr --libdir=/usr/lib32 \
	--sysconfdir=/etc/dosbox
  make
}

package() {
  cd "$srcdir/dosbox"
  make DESTDIR="$pkgdir" install

  install -Dm644 README \
	"$pkgdir/usr/share/doc/dosbox/README"
  install -Dm644 docs/README.video \
	"$pkgdir/usr/share/doc/dosbox/README.video"
  install -Dm644 "$srcdir/dosbox.png" \
	"$pkgdir/usr/share/pixmaps/dosbox.png"
  install -Dm644 "$srcdir/dosbox.desktop" \
	"$pkgdir/usr/share/applications/dosbox.desktop"
}

md5sums=('SKIP'
         '3dcfe45c5ed0433316eaea51e3620b36'
         '77b693e82f9dd018d1ec763a3c60ec4f'
         'b3bd98354eed6ffd9d5e8d4bc211b2c1'
         'a2acfc1790f6a820b39e6480992b81f3'
         '506e93c7b6320d4e36d28b58e39b4518'
         '5b0ba01cd7ffe0e4529cdddbae306010'
         '34fe1e5973acf57acc3b738cece61aa2'
         '4600815c281a0de8f6f3985870abe595'
         '479c9c427312e3f56cc2d034d7f346e1')
