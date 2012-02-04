# Maintainer:  Devin Cofer <ranguvar{AT]archlinux[DOT}us>
# Contributor: blasse <koralik(at)gmail(dot)com>

# This package is not a normal -hg package.  I manually bump $_workingrev every now and again when
# a revision of Firefox passes all of the Linux tests on http://bit.ly/1O4siz

pkgname=firefox-pgo-minefield
pkgver=100207
pkgrel=1
_prever=3.7a2pre
_workingrev='d632fb50f68d'
_mozver=central
pkgdesc="Mozilla Firefox customizable web browser (XULRunner independent, PGO optimized, 64-bit TraceMonkey, dev tree)"
url="http://www.mozilla.org/projects/firefox"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')

_soundsystem='alsa-lib'  # 'alsa-lib' for ALSA, 'oss' for OSS

makedepends=('mercurial' 'autoconf2.13' 'gcc>=4.4' 'zip' 'pkgconfig'
             'diffutils' 'libgnomeui>=2.24.1' 'python' 'wireless_tools')
depends=('gtk2>=2.18.0' 'gcc-libs>=4.4' 'libidl2>=0.8.13' 'mozilla-common'
         'nss>=3.12.4' 'libxt' 'hunspell>=1.2.8' 'startup-notification>=0.10'
         'libnotify>=0.4' 'mime-types' 'dbus-glib>=0.82' 'desktop-file-utils'
         'cairo' 'libpng>=1.4.0' ${_soundsystem})
replaces=('firefox-hg-pgo')
provides=("firefox=$_prever" "firefox-hg=$pkgver" "firefox-pgo=$_prever"
          "firefox-beta=$_prever" "firefox-pgo-beta=$_prever")
conflicts=('firefox' 'firefox-hg' 'firefox-pgo' 'firefox-beta'
           'firefox-pgo-beta' 'firefox-pgo-minefield-smp')

source=('mozconfig'
        'firefox.desktop'
        'firefox-safe.desktop'
        'fix-mozilla-launcher.patch'
        'mozilla-firefox-1.0-lang.patch'
        'ldflags-namespec.patch'
        'jemalloc-enable-pgo.patch'
        'potential-pgo-fix.patch')
sha256sums=('8d08ee111b88473a53e8c0852d463971af7a827f796a94d3fe74ca2eed76ca0b'
            '21722965bb0bab05e3fbd2f584dbcaeb9f0726ed755f59bbf6fb26a7f964e6ec'
            '00641e2d7ba45a607522a621aa86c21e13b2951ebca920b1e0b538b0e1188445'
            'd4948cc5878b2100b4d19b0fbc09119c34377593c5847678d5788db2b4e0fe43'
            '0ca095ff2af57297f615877a7e79ddc84d1a3f62509a8af6ca50aad7a8671f6a'
            '0e9631fdad5efa3fd7a95b59171f5d15420d10aa61748b920cc994ee9227915c'
            'e6b8345215eb0c595cadfd6b1abb3a12a1cad8b8b1f3528e6affc58900695215'
            'bf53a9712aada73dbecb45516bf932b52e7b8debf25cf19294adbfcc54d80028')

# Don't use normal _hgroot/_hgrepo, we don't want Pacman automagically changing the pkgver.
_ff_hgroot="http://hg.mozilla.org/"


build() {
	msg "* Note: If the build fails, try again, try without jemalloc PGO, and try     *"
	msg "* without PGO at all. Also, try with 'potential-pgo-fix.patch'. PGO can be   *"
	msg "* temperamental -- it can sometimes take two or three builds before you'll   *"
	msg "* get a good one.                                                            *"
	sleep 10

	cd "$srcdir"
	# It can take a long time to re-fetch the Mozilla source...
	# The commented lines are for use by experienced users who build often.
	hg clone "$_ff_hgroot/mozilla-$_mozver" "mozilla-$_mozver" || return 1
#	tar xf "$startdir/mozilla-$_mozver.tar.gz" || return 1
	cd "mozilla-$_mozver"
#	hg pull || return 1
#	hg update || return 1
#	cd ..
#	tar czf "$startdir/mozilla-$_mozver.tar.gz" "mozilla-$_mozver" || return 1
#	cd "mozilla-$_mozver"
	hg up "$_workingrev" || return 1  # Comment out this line to use the untested latest source.

	cp "$srcdir/mozconfig" .mozconfig || return 1
	# Don't strip if the user doesn't want to... ;p
	if [ "$(check_option strip)" = "n" ]; then
		sed -i 's/--enable-strip/--disable-strip/' \
			.mozconfig || return 1
		sed -i 's/--enable-install-strip/--disable-install-strip/' \
			.mozconfig || return 1
	fi

	if [ "$_soundsystem" = "oss" ]; then
		msg "Using OSS instead of ALSA."
		sed -i 's/sydney_audio_alsa/sydney_audio_oss/' \
		       media/libsydneyaudio/src/Makefile.in || return 1
		# Get rid of ALSA config system stuff (requires autoconf rerun)
		sed -i '/alsa\//d' config/system-headers || return 1
		sed -i '/alsa\//d' js/src/config/system-headers || return 1
		sed -i '/LIB(asound/d' configure.in || return 1
	fi


	msg "Patching source."
	msg "Patches from main Arch xulrunner/firefox packages..."
	# Fix stub launcher - Arch
	patch -Np0 -i "$srcdir"/fix-mozilla-launcher.patch || return 1
	# Use LANG environment variable to choose locale
	patch -Np1 -i "$srcdir"/mozilla-firefox-1.0-lang.patch || return 1


	msg "Patches from this package..."
	# PGO compilation LDFLAGS fix
	patch -Np1 -i "$srcdir"/ldflags-namespec.patch || return 1
	# Enable experimental PGO for jemalloc (speed).
	# See Mozilla bugs #418866 and #419470.
	patch -Np0 -i "$srcdir"/jemalloc-enable-pgo.patch || return 1
	# Sometimes necessary for PGO build to work, especially when PGO compile
	# aborts with an error about control sum mismatch (thx to methuselah!)
#	patch -Np1 -i "$srcdir/potential-pgo-fix.patch" || return 1


	msg "Setting up build."
	# Changing the user's optimization flags is justified, because this is
	# a package specifically for an optimized software build, and because of
	# the official branding, binaries can't be redistributed anyways.
	# These flags just set guidelines for the build, they are overridden in
	# most compile job pieces by Firefox's better judgement.
	export CFLAGS="-march=native -O2 -pipe"
	export CXXFLAGS="-march=native -O2 -pipe"
	# The hash-style and as-needed flags are in Arch defaults anyways,
	# and the other optimization flags are almost definitely safe.
	export LDFLAGS="-Wl,-rpath,/usr/lib/firefox-$_prever -Wl,-O1,--sort-common,--hash-style=gnu,--as-needed"

	autoconf-2.13 || return 1


	msg "Actual build."
	# Yes, all this is SMP -- MOZ_MAKE_FLAGS takes care of it.
	# Compile a non-PGO build first to reduce chance of error in PGO build.
	make -j1 -f client.mk build MOZ_MAKE_FLAGS="$MAKEFLAGS" || return 1
	# Comment out remaining lines for a non-PGO build.
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
	cd "$srcdir/mozilla-$_mozver"

	msg "Installing to $pkgdir."
	make -j1 DESTDIR="$pkgdir" -C ff-pgo install || return 1

	install -Dm644 "$srcdir/mozilla-$_mozver/other-licenses/branding/firefox/mozicon128.png" \
		"$pkgdir/usr/share/pixmaps/firefox.png" || return 1
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
