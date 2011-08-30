# Contributor: Flamelab <panosfilip@gmail.com>
# Based on: firerox-pgo-minefield PKGBUILD by ranguvar

pkgname=firefox-pgo-hg
pkgver=76168
pkgrel=1
_prever=9.0a1
_mozver=central
pkgdesc="Standalone web browser from mozilla.org, latest development version. XULRunner independent, PGO optimized."
url="http://www.mozilla.org/projects/firefox"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')

_soundsystem='alsa-lib'  # 'alsa-lib' for ALSA, 'oss' for OSS
#_soundsystem='oss'

depends=('gtk2>=2.20.1' 'gcc-libs>=4.5.1' 'libidl2>=0.8.13' 'mozilla-common'
         'nss>=3.12.8' 'libxt' 'hunspell>=1.2.12' 'startup-notification>=0.10'
         'libnotify>=0.4' 'mime-types' 'dbus-glib>=0.86' 'desktop-file-utils'
         'cairo>=1.10.2-2' 'libpng>=1.4.0' 'libevent>=2.0.10'  'lcms>=1.19' 'nspr>=4.8.7'
         'libvpx>=0.9.6-2' 'alsa-lib>=1.0.23' 'sqlite3>=3.7.4')
makedepends=('autoconf2.13' 'gcc>=4.5.1' 'yasm>=1.0.1' 'zip' 'pkg-config' 'diffutils'
             'libgnomeui>=2.24.1' 'python2' 'wireless_tools' 'xorg-server-xvfb' 'mercurial' ${_soundsystem})
provides=("firefox=$_prever")
conflicts=('firefox')

source=(mozconfig
        firefox.desktop
        firefox-safe.desktop
        ldflags-namespec.patch
        jemalloc-enable-pgo.patch
        potential-pgo-fix.patch
)

_hgroot="http://hg.mozilla.org/"
_hgrepo=mozilla-central


build() {

  
  cd ${srcdir}
  if [ -d mozilla-central-build ];
     then rm -r mozilla-central-build;
  fi
  msg "Creating a build directory..."
  hg clone mozilla-central mozilla-central-build
  msg "Entering build directory..."
  cd mozilla-central-build
  cp ${srcdir}/mozconfig .mozconfig
	# Don't strip if the user doesn't want to... ;p
	if [ "$(check_option strip)" = "n" ]; then
		msg "Source debugging symbols' stripping is disabled. This package can be used for debugging."
		sed -i 's/--enable-strip/--disable-strip/' \
			.mozconfig || return 1
		sed -i 's/--enable-install-strip/--disable-install-strip/' \
			.mozconfig || return 1
	fi

	if [ "$_soundsystem" = "oss" ]; then
		msg "Using OSS instead of ALSA..."
		sed -i 's/sydney_audio_alsa/sydney_audio_oss/' \
		       media/libsydneyaudio/src/Makefile.in || return 1
		# Get rid of ALSA config system stuff (requires autoconf rerun)
		sed -i '/alsa\//d' config/system-headers || return 1
		sed -i '/alsa\//d' js/src/config/system-headers || return 1
		sed -i '/LIB(asound/d' configure.in || return 1
	fi


	msg "Patching source."
	msg "Patches used for PGO optimisation..."
	# PGO compilation LDFLAGS fix
	patch -Np1 -i "$srcdir"/ldflags-namespec.patch || return 1
	# Enable experimental PGO for jemalloc (speed).
	patch -Np0 -i "$srcdir"/jemalloc-enable-pgo.patch || return 1
        
        #Fix, in case build fails.
	#patch -Np1 -i "$srcdir/potential-pgo-fix.patch" || return 1
    
	msg "Setting up build."
	export CFLAGS="-march=native -O2 -pipe"
	export CXXFLAGS="-march=native -O2 -pipe"

	export LDFLAGS="-Wl,-rpath,/usr/lib/firefox-$_prever -Wl,-O1,--sort-common,--hash-style=gnu,--as-needed"

	autoconf-2.13 || return 1


	msg "Actual build."

	make -j1 -f client.mk build MOZ_MAKE_FLAGS="$MAKEFLAGS" || return 1
	msg "Profiled build now."
	# Don't let PGO disrupt the user, use a virtual framebuffer.
	LD_PRELOAD="" /usr/bin/Xvfb -nolisten tcp -extension GLX :99 &
	XPID=$!  # Store the PID of the framebuffer
	DISPLAY=:99 LD_PRELOAD="" make -j1 -f client.mk profiledbuild \
		MOZ_MAKE_FLAGS="$MAKEFLAGS"
	RC=$?  # Store the make return code
	kill -9 $XPID  # Kill the framebuffer
	if [ $RC != 0 ]; then  # Build did not succeed, fail
		return 1
	fi
}
package() {

	

	cd "$srcdir/mozilla-central-build"

        export PYTHON=python2

	msg "Installing to $pkgdir."
	make -j1 DESTDIR="$pkgdir" -C ff-pgo install || return 1

	#install -Dm644 "$srcdir/mozilla-$_mozver/other-licenses/branding/firefox/mozicon128.png" \
	#	"$pkgdir/usr/share/pixmaps/firefox.png" || return 1
	install -Dm644 "$srcdir/firefox.desktop" \
		"$pkgdir/usr/share/applications/firefox.desktop" || return 1
	install -Dm644 "$srcdir/firefox-safe.desktop" \
		"$pkgdir/usr/share/applications/firefox-safe.desktop" \
		|| return 1

	# Remove devel stuff.
	rm -rf "$pkgdir/usr/include/"
	rm -rf "$pkgdir/usr/lib/firefox-devel-$_prever/"
	rm -rf "$pkgdir/usr/share/idl/"
}


md5sums=('76d59e0eef541ea99ccc3f8df9cb9f29'
         '68cf02788491c6e846729b2f2913bf79'
         '5e68cabfcf3c021806b326f664ac505e'
         '9e461e5fc73b241d68d08be908405a5e'
         'df6fde73c9fdb38245f50b9b5bb09024'
         '9587e0e6da42c883e34a46ee35cc3b7d')
