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

pkgname=firefox-pgo-beta
_mozver=2.0
_ffmajorver=4.0
_ffver=${_ffmajorver}.1
_build=
pkgver=${_ffver}${_build}
pkgrel=1
pkgdesc="Mozilla Firefox customizable web browser (XULRunner-independent, profile-guided optimization, beta)"
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
provides=("firefox=$pkgver" "firefox-pgo=$pkgver")
conflicts=('firefox' 'firefox-beta' 'firefox-pgo' 'firefox-pgo-minefield' 'firefox-pgo-minefield-smp')

source=("ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/$_ffver/source/firefox-$_ffver.source.tar.bz2"
        'mozconfig'
        'firefox.desktop'
        'firefox-safe.desktop'
        'firefox.install'
        'profile-manual.sh'
        'mozilla-pkgconfig.patch'
        'xulrunner-version.patch'
        'firefox-version.patch'
        'xulrunner-omnijar.patch'
        'port_gnomevfs_to_gio.patch'
        'mozilla-firefox-1.0-lang.patch'
        'crashreporter-remove-static.patch'
        'mozilla-libjpeg-turbo.patch'
        'fix-nsGIOService.patch'
        'eliminate-deprecated-gtk-type-macros.patch'
        'update-ply-2.5-to-3.3.patch'
        'reload-new-plugins.patch'
        'plugin-for-mimetype-pref.patch'
        'firefox-browser-css.patch'
        'ldflags-namespec.patch'
        'jemalloc-enable-pgo.patch')
sha256sums=('cf3a39877facc229a67760915341fe95095cca647faab3a7adcb70046105199c'
            '53fdf43532125d5b2e17eb2546dadbd2ea0abdc3c975f9cbfc4ad43b08cd80cb'
            'cfb1b3442d94650ee3629d7a0a860f6e0ffd337773e4c25ec39c3a061af673f9'
            '4b6de45753856a890f4482055666e77f9b01bdfb7e0df08bafaa3a4d9937eed3'
            'd7e29cff81972da7008e9eb036fa2e74674a854134791d5df6ae94e3c536ef00'
            'dbbdfa2edd8d45e1cdafa852877f2df0c9926f0407d78b49da9e6ab1856a0622'
            '1530226270332c89c8debf5d638080c59dff05c328811a7321e1c31ae3d6d702'
            '1aee4194691b2f1cc007117e9cd4f84128c3dfa8179a0a869466551f032d3ed0'
            '101def78fe2959fb2c6cacd9b6abe2906faa74788a1e680496b521b1643bb5e5'
            '85477a548a90d98446f618cecb280c5a5fdb74f83f39da74327653bbc41f653e'
            'ef502dbaac234cda064abb060e6f8df033942c57bdf759396fd3f481fe4e32c8'
            '0ca095ff2af57297f615877a7e79ddc84d1a3f62509a8af6ca50aad7a8671f6a'
            '72d8ef7b40172a0cbef957b5f6d459fb53beb9c07e8b713f530b3d7844df091c'
            'e1cad999850104b575f9a2e4471ebc0ceaadab26a592b13cd5b9f2c73395ebf9'
            '991d0b968794b569d3b107b0aab8786d9c83007c892c7e76143b5af09ef94405'
            'b325edc321808db9928a42316f2394e1df7c5e44c7e43664c74ef0f293fbfd78'
            '50a72984b0b9c724960e9fafec761fcf8504bf4cf581247e492ca996cb8fae1a'
            '0f48011fd69c5fdbbcf399feb47270f8d54d74f91da501d5e5d314a9eb0fcd4f'
            '13924242f13f295867fe9108868ac6cfbb04cfc10dffe75f0fa69bbfa8688a92'
            'd706a6e6febedf707f9f525cf7a3025cc64ebef96d25f486ce84e96941739dfa'
            '0e9631fdad5efa3fd7a95b59171f5d15420d10aa61748b920cc994ee9227915c'
            'e6b8345215eb0c595cadfd6b1abb3a12a1cad8b8b1f3528e6affc58900695215')
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
	# Fix libdir/sdkdir - Fedora, Arch
	patch -Np1 -i "$srcdir"/mozilla-pkgconfig.patch
	# Force installation to the same path for every version - Arch, Fedora
	patch -Np1 -i "$srcdir"/xulrunner-version.patch
	patch -Np1 -i "$srcdir"/firefox-version.patch
	# Mozilla bug #620931 - Arch, Fedora
	patch -Np1 -i "$srcdir"/xulrunner-omnijar.patch
	# Mozilla bug #494163 - Arch, Fedora
	patch -Np1 -i "$srcdir"/port_gnomevfs_to_gio.patch
	# Use LANG environment variable to choose locale - Arch
	patch -Np1 -i "$srcdir"/mozilla-firefox-1.0-lang.patch
	# We don't have an old libstdc++ - Fedora
	patch -Np1 -i "$srcdir"/crashreporter-remove-static.patch
	# libjpeg-turbo - Fedora
	patch -Np2 -i "$srcdir"/mozilla-libjpeg-turbo.patch
	# nsGIOService fixes - Ubuntu
	patch -Np1 -i "$srcdir"/fix-nsGIOService.patch
	# Update deprecated GTK type macros - Ubuntu
	patch -Np1 -i "$srcdir"/eliminate-deprecated-gtk-type-macros.patch
	# Ensure that new plugins are reloaded - Ubuntu
	patch -Np1 -i "$srcdir"/reload-new-plugins.patch
	# Update PLY - Ubuntu
	patch -Np1 -i "$srcdir"/update-ply-2.5-to-3.3.patch
	# Add control over plugins used for each mime-type via preferences - Ubuntu
	patch -Np1 -i "$srcdir"/plugin-for-mimetype-pref.patch
	# Dark color theme support - OpenSUSE
	patch -Np1 -i "$srcdir"/firefox-browser-css.patch

	msg2 "Patches from this package..."
	# PGO compilation LDFLAGS fix
	patch -Np1 -i "$srcdir"/ldflags-namespec.patch
	# Enable experimental PGO for jemalloc (speed).
	# See Mozilla bugs #418866 and #419470.
	patch -Np0 -i "$srcdir"/jemalloc-enable-pgo.patch


	msg2 "Setting up build..."
	# Changing the user's optimization flags is justified, because this is
	# a package specifically for an optimized software build, and because of
	# the official branding, binaries can't be redistributed anyways.
	# These flags just set guidelines for the build, they are overridden in
	# most compile job pieces by Firefox's better judgement.
	export CFLAGS="-march=native -O2 -fpermissive -pipe"
	export CXXFLAGS="-march=native -O2 -fpermissive -pipe"
	# The hash-style and as-needed flags are in Arch defaults anyways,
	# and the other optimization flags are almost definitely safe.
	export LDFLAGS="-Wl,-rpath,/usr/lib/firefox-$_ffmajorver -Wl,-O1,--sort-common,--hash-style=gnu,--as-needed"
	export PYTHON=python2
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

	# Remove devel stuff
	rm -rf "$pkgdir"/usr/include/
	rm -rf "$pkgdir"/usr/lib/firefox-devel-$_ffmajorver/
	rm -rf "$pkgdir"/usr/share/idl/
}
