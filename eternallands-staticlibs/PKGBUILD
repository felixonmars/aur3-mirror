# Maintainer: Robert McCathie <archaur at rmcc dot com dot au>

# Contributor (cal3d): Hussam Al-Tayeb <ht990332@gmail.com>

# Contributor (libvorbis): Tobias Kieslich <tobias@archlinux.org>
# Contributor (libvorbis): dorphell <dorphell@archlinux.org>
# Contributor (libvorbis): John Proctor <jproctor@prium.net>

# Contributer (openal): Allan McRae <allan@archlinux.org>
# Contributer (openal): Jason Chu <jchu@xentac.net>

# Contributor (mesa): Jan de Groot <jgc@archlinux.org>
# Contributor (mesa): Andreas Radke <andyrtr@archlinux.org>

# Contributor (glew): Stéphane Gaudreault <stephane@archlinux.org>
# Contributor (glew): SleepyDog


pkgname=eternallands-staticlibs
pkgver=1.1
pkgrel=1
pkgdesc="Static (.a) versions of libcal3d, libvorbis, libopenal, libGLU and libGLEW. Used for building an Eternal Lands (MMORPG) static binary."
license=('GPL2' 'custom' 'LGPL' 'BSD' 'MIT')
arch=('i686' 'x86_64')
url="http://www.eternal-lands.com/forum/index.php?showtopic=55516"

source=("http://download.gna.org/cal3d/sources/cal3d-0.11.0.tar.gz" 'cal3d-gcc43.diff' # cal3d sources
        "http://downloads.xiph.org/releases/vorbis/libvorbis-1.3.2.tar.gz" # libvorbis sources
        "http://kcat.strangesoft.net/openal-releases/openal-soft-1.13.tar.bz2" # openal sources
        "ftp://ftp.freedesktop.org/pub/mesa/7.10.2/MesaLib-7.10.2.tar.bz2" 'gnome-shell-shader-fix.patch' 'nouveau-fix-header.patch' # libglu (mesa) sources
        "http://downloads.sourceforge.net/glew/glew-1.6.0.tgz" # glew sources
        )

md5sums=('82ad09c1c28e73bc9596aec47237bfba' # cal3d source
         'f290fb54f844e044ae80165f083cf58f' # cal3d patch - cal3d-gcc43.diff
         'c870b9bd5858a0ecb5275c14486d9554' # libvorbis source
         '58b7d2809790c70681b825644c5f3614' # openal source
         'f5de82852f1243f42cc004039e10b771' # libglu (mesa) source
         '3ec78f340f9387abd7a37b195e764cbf' # libglu (mesa) patch - gnome-shell-shader-fix.patch
         '67c87b77cc2236b52a3b47dad3fbb5d4' # libglu (mesa) patch - nouveau-fix-header.patch
         '7dfbb444b5a4e125bc5dba0aef403082' # glew source
         )

depends=('gcc-libs' # cal3d depends
         'libogg' # libvorbis depends
         'glibc' # openal depends
         'libxmu' 'libxi' 'mesa' # glew depends
         )

makedepends=('patch' # cal3d makedepends
             'alsa-lib' 'sdl' 'pkgconfig' 'cmake' 'libpulse' # openal makedepends
             'glproto>=1.4.12' 'pkgconfig' 'libdrm>=2.4.23' 'libxxf86vm>=1.1.0' 'libxdamage>=1.1.3' 'expat>=2.0.1' 'libx11>=1.3.5' 'libxt>=1.0.8' 'gcc-libs>=4.5' 'dri2proto=2.3' 'python2' 'libxml2' 'imake' # libglu (mesa) makedepends
             )


build() {
	
	## Start cal3d
	
	cd "$srcdir/cal3d-0.11.0"
	patch -p0 -i "$startdir/cal3d-gcc43.diff"
	./configure --prefix=/usr --enable-static
	make
	make DESTDIR="$srcdir/cal3d_installed" install
	
	install -D -m644 "$srcdir/cal3d_installed/usr/lib/libcal3d.a" "$pkgdir/usr/lib/eternallands-static/libcal3d.a"


	## Start libvorbis
	
	cd "$srcdir/libvorbis-1.3.2"
	#-march=i686 optimizes too much, strip it out
	CFLAGS=${CFLAGS/-march=$CARCH} ./configure --prefix=/usr
	make
	make DESTDIR="$srcdir/libvorbis_installed" install
	
	install -D -m644 "$srcdir/libvorbis_installed/usr/lib/libvorbis.a" "$pkgdir/usr/lib/eternallands-static/libvorbis.a"
	install -D -m644 "$srcdir/libvorbis_installed/usr/lib/libvorbisfile.a" "$pkgdir/usr/lib/eternallands-static/libvorbisfile.a"


	## Start openal
	
	cd "$srcdir/openal-soft-1.13/build"
	cmake -D CMAKE_INSTALL_PREFIX=/usr -D LIBTYPE=STATIC -D CMAKE_BUILD_TYPE=Release ..
	make
	
	install -D -m644 "$srcdir/openal-soft-1.13/build/libopenal.a" "$pkgdir/usr/lib/eternallands-static/libopenal.a"

	
	## Start mesa (libGLU)
	
	cd "$srcdir/Mesa-7.10.2"
	
	#backport from master to fix gnome-shell shader
	#https://bugs.freedesktop.org/show_bug.cgi?id=35714
	patch -Np1 -i "${srcdir}/gnome-shell-shader-fix.patch"
	patch -Np1 -i "${srcdir}/nouveau-fix-header.patch"
	
	./configure --prefix=/usr \
	--enable-gallium-radeon \
	--enable-gallium-r600 \
	--enable-gallium-nouveau \
	--enable-gallium-swrast \
	--enable-glx-tls \
	--with-driver=xlib \
	--enable-xcb \
	--with-state-trackers=glx \
	--disable-glut \
	--enable-gles1 \
	--enable-gles2 \
	--enable-egl \
	--disable-gallium-egl \
	--enable-static
	
	make
	
	install -D -m644 "$srcdir/Mesa-7.10.2/lib/libGLU.a" "$pkgdir/usr/lib/eternallands-static/libGLU.a"
	
	
	## Start glew (libGLU)
	cd "${srcdir}/glew-1.6.0"
	sed -i 's|lib64|lib|' config/Makefile.linux
	make
	
	install -D -m644 "$srcdir/glew-1.6.0/lib/libGLEW.a" "$pkgdir/usr/lib/eternallands-static/libGLEW.a"
}
