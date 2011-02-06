# Contributor: Thomas Baechler <thomas@archlinux.org>
# Maintainer: Jonathan Schmidt <j.schmidt@archlinux.us>

pkgname=nvidia-96xx-utils-glselect
pkgver=96.43.16
pkgrel=1
pkgdesc="NVIDIA drivers utilities and libraries with libgl compatibility through glselect."
arch=('i686' 'x86_64')
[ "$CARCH" = "i686"   ] && ARCH=x86
[ "$CARCH" = "x86_64" ] && ARCH=x86_64
url="http://www.nvidia.com/"
depends=('xorg-server')
optdepends=('gtk2: nvidia-settings' 'pkgconfig: nvidia-xconfig')
conflicts=('nvidia-96xx-utils')
provides=("nvidia-96xx-utils=$pkgver")
license=('custom')
install=nvidia.install
options=(!strip)
source=("http://download.nvidia.com/XFree86/Linux-${ARCH}/${pkgver}/NVIDIA-Linux-${ARCH}-${pkgver}-pkg0.run" 'glselect')
md5sums=('7479b25c747e29af95b9ccf06f43fbf9' '128787899ce0e0c08ae8e129a0663de4')
[ "$CARCH" = "x86_64" ] && md5sums=('73e226d4ee0996b6df4bdf44cc1fc6f5' '128787899ce0e0c08ae8e129a0663de4')

build() {
	cd $srcdir
	sh NVIDIA-Linux-${ARCH}-${pkgver}-pkg0.run --extract-only
	cd NVIDIA-Linux-${ARCH}-${pkgver}-pkg0/usr/

	mkdir -p $pkgdir/usr/{lib,bin,share/applications,share/pixmaps,share/man/man1}
	mkdir -p $pkgdir/usr/lib/xorg/modules/{extensions,drivers}
	mkdir -p $pkgdir/usr/share/licenses/nvidia-96xx/

	install lib/{libGLcore,libGL,libnvidia-cfg,tls/libnvidia-tls}.so.${pkgver} \
	$pkgdir/usr/lib/ || return 1
	install -m644 share/man/man1/* $pkgdir/usr/share/man/man1/ || return 1
	rm $pkgdir/usr/share/man/man1/nvidia-installer.1.gz || return 1
	install X11R6/lib/libXv* $pkgdir/usr/lib/ || return 1
	install -m644 share/applications/nvidia-settings.desktop $pkgdir/usr/share/applications/ || return 1
	# fix nvidia .desktop file
	sed -e 's:__UTILS_PATH__:/usr/bin:' -e 's:__PIXMAP_PATH__:/usr/share/pixmaps:' -i $pkgdir/usr/share/applications/nvidia-settings.desktop
	install -m644 share/pixmaps/nvidia-settings.png $pkgdir/usr/share/pixmaps/ || return 1
	install X11R6/lib/modules/drivers/nvidia_drv.so $pkgdir/usr/lib/xorg/modules/drivers || return 1
	install X11R6/lib/modules/extensions/libglx.so.$pkgver $pkgdir/usr/lib/xorg/modules/extensions || return 1
	install -m755 bin/nvidia-{settings,xconfig,bug-report.sh} $pkgdir/usr/bin/ || return 1
	cd $pkgdir/usr/lib/
	ln -s libGLcore.so.$pkgver libGLcore.so.1 || return 1
	ln -s libnvidia-cfg.so.$pkgver libnvidia-cfg.so.1 || return 1
	ln -s libnvidia-tls.so.$pkgver libnvidia-tls.so.1 || return 1
	ln -s libXvMCNVIDIA.so.$pkgver libXvMCNVIDIA_dynamic.so.1 || return 1

	install -m644 $srcdir/NVIDIA-Linux-${ARCH}-${pkgver}-pkg0/LICENSE $pkgdir/usr/share/licenses/nvidia-96xx/ || return 1
	ln -s nvidia-96xx $startdir/pkg/usr/share/licenses/nvidia-96xx-utils || return 1

	install -D -m644 $srcdir/NVIDIA-Linux-${ARCH}-${pkgver}-pkg0/usr/share/doc/README.txt $pkgdir/usr/share/doc/nvidia-96xx/README || return 1

	find $pkgdir/usr -type d -exec chmod 755 {} \;
	chmod 644 $pkgdir/usr/lib/libXvMCNVIDIA.a

	# Allow gl lib link switching with glselect
	install $srcdir/glselect $pkgdir/usr/bin/ || return 1
}
