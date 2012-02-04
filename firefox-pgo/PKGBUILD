# Maintainer:  Devin Cofer <ranguvar@archlinux.us>
# Contributor: wantilles <wantilles@adslgr.com>
# Contributor: blasse <koralik(at)gmail(dot)com>

# Package Maintenance Resources:
# http://projects.archlinux.org/svntogit/packages.git/tree/xulrunner/trunk/
# http://projects.archlinux.org/svntogit/packages.git/tree/firefox/trunk/
# http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/net-libs/xulrunner/
# http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/www-client/firefox/
# http://dev.gentoo.org/~anarchy/mozilla/patchsets/
# http://bazaar.launchpad.net/~mozillateam/xulrunner/xulrunner-2.0.head/files/head:/debian/patches/
# http://bazaar.launchpad.net/~mozillateam/firefox/firefox-4.0.head/files/head:/debian/patches/
# http://pkgs.fedoraproject.org/gitweb/?p=xulrunner.git;a=summary
# http://pkgs.fedoraproject.org/gitweb/?p=firefox.git;a=summary
# http://www.freebsd.org/cgi/cvsweb.cgi/ports/www/libxul/
# http://www.freebsd.org/cgi/cvsweb.cgi/ports/www/firefox/
# http://aur.archlinux.org/packages.php?ID=45446

pkgname=firefox-pgo
_mozver=release
_ffmajorver=5.0
_ffver=${_ffmajorver}.1
_build=
pkgver=${_ffver}${_build}
pkgrel=1
pkgdesc="Mozilla Firefox customizable web browser (XULRunner-independent, profile-guided optimization)"
url="http://www.mozilla.com/firefox/"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')

_soundsystem='alsa-lib'  # 'alsa-lib' for ALSA, 'oss' for OSS

makedepends=('autoconf2.13' 'zip' 'diffutils' 'python2' 'wireless_tools'
             'yasm>=0.7.1' 'mesa' 'xorg-server-xvfb')
depends=('gtk2' 'gcc-libs' 'libidl2' 'mozilla-common' 'nspr' 'nss' 'libxt'
         'hunspell' 'startup-notification' 'libnotify' 'mime-types' 'lcms'
         'dbus-glib' 'desktop-file-utils' 'libpng' 'cairo>=1.10.2-2' 'libevent'
         'libvpx>=0.9.6-2' ${_soundsystem})
optdepends=('firefox-i18n: Language packs')
provides=("firefox=$pkgver")
conflicts=('firefox' 'firefox-beta' 'firefox-pgo-beta' 'firefox-pgo-minefield' 'firefox-pgo-minefield-smp')

source=("ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/$_ffver/source/firefox-$_ffver.source.tar.bz2"
        'mozconfig'
        'firefox.desktop'
        'firefox-safe.desktop'
        'firefox.install'
        'profile-manual.sh'
        'firefox-version.patch'
        'mozilla-pkgconfig.patch'
        'mozilla-firefox-1.0-lang.patch'
        'mozilla-libjpeg-turbo.patch'
        'reload-new-plugins.patch'
        'plugin-for-mimetype-pref.patch'
        'firefox-browser-css.patch')
sha256sums=('7016db35da8f274b1606eba2bde4c5adfb9219ec053e2fcfffac63aefd82ab9f'
            '53fdf43532125d5b2e17eb2546dadbd2ea0abdc3c975f9cbfc4ad43b08cd80cb'
            'cfb1b3442d94650ee3629d7a0a860f6e0ffd337773e4c25ec39c3a061af673f9'
            '4b6de45753856a890f4482055666e77f9b01bdfb7e0df08bafaa3a4d9937eed3'
            'd7e29cff81972da7008e9eb036fa2e74674a854134791d5df6ae94e3c536ef00'
            'dbbdfa2edd8d45e1cdafa852877f2df0c9926f0407d78b49da9e6ab1856a0622'
            'fa4e6806c4c1788e72c6074b80a300d60e2c605b96ebfe9efa38b5a72fe957c5'
            '1530226270332c89c8debf5d638080c59dff05c328811a7321e1c31ae3d6d702'
            '0ca095ff2af57297f615877a7e79ddc84d1a3f62509a8af6ca50aad7a8671f6a'
            'e1cad999850104b575f9a2e4471ebc0ceaadab26a592b13cd5b9f2c73395ebf9'
            '0f48011fd69c5fdbbcf399feb47270f8d54d74f91da501d5e5d314a9eb0fcd4f'
            '13924242f13f295867fe9108868ac6cfbb04cfc10dffe75f0fa69bbfa8688a92'
            'd706a6e6febedf707f9f525cf7a3025cc64ebef96d25f486ce84e96941739dfa')
install='firefox.install'


build() {
	# 93 length = 80 on output
	msg "* Note: If the build fails, try again, try without jemalloc PGO, and try without"
	msg "* PGO at all. PGO can be very temperamental -- it can sometimes take two or"
	msg "* three builds before you'll get a good one."
	sleep 5
	cd "$srcdir"/mozilla-$_mozver

	cp "$srcdir"/mozconfig .mozconfig
	# Don't strip if the user doesn't want us to... ;p
	if [ "$(check_option strip)" = "n" ]; then
		sed -i 's/--enable-strip/--disable-strip/' .mozconfig
		sed -i 's/--enable-install-strip/--disable-install-strip/' \
			.mozconfig
	fi
	if [ "$_soundsystem" = "oss" ]; then
		msg2 "Using OSS instead of ALSA."
		sed -i 's/sydney_audio_alsa/sydney_audio_oss/' \
		       media/libsydneyaudio/src/Makefile.in
		# Get rid of ALSA config system stuff (requires autoconf rerun)
		sed -i '/alsa\//d' config/system-headers
		sed -i '/alsa\//d' js/src/config/system-headers
		sed -i '/LIB(asound/d' configure.in
	fi


	msg2 "Patches from distro packages..."
	# Set proper install dir
	patch -Np1 -i "$srcdir"/firefox-version.patch
	# Fix libdir/sdkdir - Fedora, Arch
	patch -Np1 -i "$srcdir"/mozilla-pkgconfig.patch
	# Use LANG environment variable to choose locale - Arch
	patch -Np1 -i "$srcdir"/mozilla-firefox-1.0-lang.patch
	# libjpeg-turbo - Fedora
	patch -Np2 -i "$srcdir"/mozilla-libjpeg-turbo.patch
	# Ensure that new plugins are reloaded - Ubuntu
	patch -Np1 -i "$srcdir"/reload-new-plugins.patch
	# Add control over plugins used for each mime-type via preferences - Ubuntu
	patch -Np1 -i "$srcdir"/plugin-for-mimetype-pref.patch
	# Dark color theme support - OpenSUSE
	patch -Np1 -i "$srcdir"/firefox-browser-css.patch


	# Kill @PRE_RELEASE_SUFFIX@ from browser.xul because it
	# gets set to \177 for an unknown reason
	sed -i 's/@PRE_RELEASE_SUFFIX@//g' \
		browser/base/content/browser.xul

	# Don't generate startup cache. Unbreaks build
	sed -i 's/^GENERATE_CACHE .*/GENERATE_CACHE = true/' \
		toolkit/mozapps/installer/packager.mk

	# PGO -- see Mozilla bugs #418866 and #419470
	sed -i '/^NO_PROFILE_GUIDED_OPTIMIZE = 1$/d' \
		memory/jemalloc/Makefile.in
	echo 'LDFLAGS += -lX11 -lXrender' >> layout/build/Makefile.in


	msg2 "Setting up build..."
	# Changing the user's optimization flags is justified, because this is
	# a package specifically for an optimized software build, and because of
	# the official branding, binaries can't be redistributed anyways.
	# These flags just set guidelines for the build, they are overridden in
	# most compile job pieces by Firefox's better judgement.
	export CFLAGS="-march=native -pipe -O2 -fstack-protector --param=ssp-buffer-size=4 -D_FORTIFY_SOURCE=2 -fpermissive"
	export CXXFLAGS="$CFLAGS"
	# The hash-style and as-needed flags are in Arch defaults anyways,
	# and the other optimization flags are almost definitely safe.
	export LDFLAGS="-Wl,-rpath,/usr/lib/firefox-$_ffmajorver -Wl,-O1,--sort-common,--as-needed,-z,relro,--hash-style=gnu"
	export PYTHON='python2'
	echo -n "mk_add_options MOZ_MAKE_FLAGS=\"$MAKEFLAGS\"" >> .mozconfig
	autoconf-2.13


	msg2 "Actual build..."
	# Yes, all this is SMP -- MOZ_MAKE_FLAGS take care of it.
	# Uncomment to compile a non-PGO build first, to reduce
	# chance of error in PGO build.  Comment lines after this also if
	# you want a non-PGO build.
	make -j1 -f client.mk build

	msg2 "PGO build..."
	# Use this block instead of the next if you wish to manually profile Firefox.
	# Just go to the desired sites and close the browser when done.
#	cp "$srcdir"/profile-manual.sh ff-pgo/_profile/pgo/profile-manual.sh
#	echo -e 'mk_add_options PROFILE_GEN_SCRIPT='\''dash $(MOZ_OBJDIR)/_profile/pgo/profile-manual.sh'\''' >> .mozconfig
#	make -j1 -f client.mk profiledbuild

	# Don't let auto-PGO disrupt the user, use a virtual framebuffer.
	LD_PRELOAD="" /usr/bin/Xvfb -nolisten tcp -extension GLX -terminate :99 &
	LD_PRELOAD="" DISPLAY=:99 make -j1 -f client.mk profiledbuild
}
package() {
	cd "$srcdir"/mozilla-$_mozver

	make -j1 DESTDIR="$pkgdir" -C ff-pgo install

	for i in 16x16 22x22 24x24 32x32 48x48 256x256; do
		install -Dm644 other-licenses/branding/firefox/default${i/x*/}.png \
			"$pkgdir"/usr/share/icons/hicolor/$i/apps/firefox.png
	done

	install -Dm644 "$srcdir"/firefox.desktop \
		"$pkgdir"/usr/share/applications/firefox.desktop
	install -Dm644 "$srcdir"/firefox-safe.desktop \
		"$pkgdir"/usr/share/applications/firefox-safe.desktop

	# Remove included dictionaries, add symlink to system myspell path
	# Note: this will cause file conflicts when users have installed dictionaries in the old location
	rm -rf "$pkgdir"/usr/lib/firefox-$_ffmajorver/dictionaries
	ln -sf /usr/share/myspell/dicts \
	       "$pkgdir"/usr/lib/firefox-$_ffmajorver/dictionaries

	# Remove devel stuff
	rm -rf "$pkgdir"/usr/include/
	rm -rf "$pkgdir"/usr/lib/firefox-devel-$_ffmajorver/
	rm -rf "$pkgdir"/usr/share/idl/
}
