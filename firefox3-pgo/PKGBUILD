# Maintainer:  Michael Duell <akurei+aur.archlinux.org{AT]luamail[DOT}net>
# Contributor: Devin Cofer <ranguvar{AT]archlinux[DOT}us>
# Contributor: blasse <koralik(at)gmail(dot)com>

pkgname=firefox3-pgo
pkgver=3.6.16
_mozver=1.9.2
pkgrel=1
pkgdesc="Mozilla Firefox customizable web browser (XULRunner independent, PGO optimized, 64-bit TraceMonkey)"
url="http://www.mozilla.org/projects/firefox"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')

_soundsystem='alsa-lib'  # 'alsa-lib' for ALSA, 'oss' for OSS

makedepends=('autoconf2.13' 'gcc>=4.4' 'zip' 'pkgconfig' 'diffutils'
             'libgnomeui>=2.24.1' 'python2' 'wireless_tools' 'yasm>=0.7.1'
             'xorg-server-xvfb')
depends=('gtk2>=2.18.0' 'gcc-libs>=4.4' 'libidl2>=0.8.13' 'mozilla-common'
         'nss>=3.12.4' 'libxt' 'hunspell>=1.2.8' 'startup-notification>=0.10'
         'libnotify>=0.4' 'mime-types' 'dbus-glib>=0.82' 'desktop-file-utils'
         'cairo' 'libpng>=1.4.0' 'libevent>=2.0' ${_soundsystem})
provides=("firefox=$pkgver" "firefox-pgo-beta=$pkgver" "firefox-beta=$pkgver")
conflicts=('firefox' 'firefox-pgo-beta' 'firefox-beta' 'firefox-pgo-minefield' 'firefox-pgo-minefield-smp')

source=("ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/$pkgver/source/firefox-$pkgver.source.tar.bz2"
        'mozconfig'
        'firefox.desktop'
        'firefox-safe.desktop'
        'firefox.install'
        'browser-defaulturls.patch'
	    'fix-mozilla-launcher.patch'
	    'mozilla-firefox-1.0-lang.patch'
	    'xulrunner-version.patch'
	    'firefox-version.patch'
	    'xulrunner-png14.patch'
        'ldflags-namespec.patch'
        'enable-x86_64-tracemonkey.patch'
        'jemalloc-enable-pgo.patch'
        'gnome-notify.patch'
        'potential-pgo-fix.patch')
sha256sums=('e0a56db439484538d7a1156304b74249a8f1108be23fb4b0dc4fb94777ae29cc'
            'b2a43c32d63ef5148596824f64d6b49830354ba2f5756e632f350e515dac0729'
            '83a14017a6a09491db22b9d6972e0bd39f528c6a79fe8695d6fc5f9350c8e293'
            '4b6de45753856a890f4482055666e77f9b01bdfb7e0df08bafaa3a4d9937eed3'
            '4fa604c579cb90ceedd6385e7757a56187f9696f0c62ff415e7ef7aec7b92179'
            'b72ea353b44fb0cbd6aecf17704711dc70090a8d4afe1320c871309c969cf33a'
            'd4948cc5878b2100b4d19b0fbc09119c34377593c5847678d5788db2b4e0fe43'
            '0ca095ff2af57297f615877a7e79ddc84d1a3f62509a8af6ca50aad7a8671f6a'
            '6c36e825ad6a35f33561678e27995e26601a91f6951af3144908560ef513d134'
            '802d3c14f5c040c225450131147d4c19bbcc0225910c4b573616851583c66886'
            '25885629767e42d06d93083b5748c95e94304bf5637997bf6446ab9b3893d1a5'
            '0e9631fdad5efa3fd7a95b59171f5d15420d10aa61748b920cc994ee9227915c'
            '20f558efbf4ed1960b390c353c7eeb94108fcdb8aaf33f1fea6caf44468aeb7c'
            'e6b8345215eb0c595cadfd6b1abb3a12a1cad8b8b1f3528e6affc58900695215'
            '00f3a5f2aa709786d5b1739cb4e212feddfd9ef3b0200848715280c87024d3f3'
            'bf53a9712aada73dbecb45516bf932b52e7b8debf25cf19294adbfcc54d80028')

install='firefox.install'


build() {
	msg "* Note: If the build fails, try again, try without jemalloc PGO, try without *"
	msg "* PGO at all, and if you're using x86_64, try without TraceMonkey. Also, try *"
	msg "* with 'potential-pgo-fix.patch'. PGO can be very temperamental -- it can    *"
	msg "* sometimes take two or three builds before you'll get a good one.           *"
	sleep 10
	cd "$srcdir"/mozilla-$_mozver

	cp "$srcdir"/mozconfig .mozconfig
	# Don't strip if the user doesn't want us to... ;p
	if [ "$(check_option strip)" = "n" ]; then
		sed -i 's/--enable-strip/--disable-strip/' .mozconfig
		sed -i 's/--enable-install-strip/--disable-install-strip/' \
			.mozconfig
	fi

	if [ "$_soundsystem" = "oss" ]; then
		msg "Using OSS instead of ALSA."
		sed -i 's/sydney_audio_alsa/sydney_audio_oss/' \
		       media/libsydneyaudio/src/Makefile.in
		# Get rid of ALSA config system stuff (requires autoconf rerun)
		sed -i '/alsa\//d' config/system-headers
		sed -i '/alsa\//d' js/src/config/system-headers
		sed -i '/LIB(asound/d' configure.in
	fi


	msg "Patching source."
	msg "Patches from distro packages..."
	# Adjust default URLs - Arch
	patch -Np1 -i "$srcdir"/browser-defaulturls.patch
	# Fix stub launcher - Arch
	patch -Np0 -i "$srcdir"/fix-mozilla-launcher.patch
	# Use LANG environment variable to choose locale
	patch -Np1 -i "$srcdir"/mozilla-firefox-1.0-lang.patch
	# Version patches(?)
	patch -Np1 -i "$srcdir"/xulrunner-version.patch
	patch -Np1 -i "$srcdir"/firefox-version.patch
	# Fix build with libpng 1.4.0 - Arch
	patch -Np0 -i "$srcdir"/xulrunner-png14.patch
    # Fix GNOME notify system
    patch -Np1 -i "$srcdir"/gnome-notify.patch 


	msg "Patches from this package..."
	# PGO compilation LDFLAGS fix
	patch -Np1 -i "$srcdir"/ldflags-namespec.patch
	# Enable TraceMonkey engine on x86_64; normally only firefox>=3.7
	# has 64-bit TM.  See Mozilla bug #489146.  Requires autoconf run.
	# Does not affect 32-bit builds. This can be problematic, but it should
	# boost speed FAR more than PGO. So, if only PGO and only TM build,
	# but not both, go with TM.
	patch -Np0 -i "$srcdir"/enable-x86_64-tracemonkey.patch
	# Enable experimental PGO for jemalloc (speed).
	# See Mozilla bugs #418866 and #419470.
	patch -Np0 -i "$srcdir"/jemalloc-enable-pgo.patch
	# Sometimes necessary for PGO build to work, especially when PGO compile
	# aborts with an error about control sum mismatch (thx to methuselah!)
#	patch -Np1 -i "$srcdir/potential-pgo-fix.patch"


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
	export LDFLAGS="-Wl,-rpath,/usr/lib/firefox-$pkgver -Wl,-O1,--sort-common,--hash-style=gnu,--as-needed"
	export PYTHON=python2

	autoconf-2.13


	msg "Actual build."
	# Yes, all this is SMP -- MOZ_MAKE_FLAGS takes care of it.
	# Compile a non-PGO build first to reduce chance of error in PGO build.
	make -j1 -f client.mk build MOZ_MAKE_FLAGS="$MAKEFLAGS"
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
	make -j1 DESTDIR="$pkgdir" -C ff-pgo install

	install -Dm644 "$srcdir/mozilla-$_mozver/other-licenses/branding/firefox/mozicon128.png" \
		"$pkgdir/usr/share/pixmaps/firefox.png"
	install -Dm644 "$srcdir/firefox.desktop" \
		"$pkgdir/usr/share/applications/firefox.desktop"
	install -Dm644 "$srcdir/firefox-safe.desktop" \
		"$pkgdir/usr/share/applications/firefox-safe.desktop"

	# Remove devel stuff.
	rm -rf "$pkgdir/usr/include/"
	rm -rf "$pkgdir/usr/lib/firefox-devel-$pkgver/"
	rm -rf "$pkgdir/usr/share/idl/"
}
