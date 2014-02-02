pkgname="pulseaudio-jprvita-git"
_pkgname="pulseaudio"
pkgdesc="A featureful, general-purpose sound server; jprvita's bluetooth branch for ofono integration"
pkgrel=1
pkgver=v3.99.1.461.gf5679c9
arch=('i686' 'x86_64')
url="http://pulseaudio.org/"
license=('GPL' 'LGPL')
depends=('rtkit' 'libltdl' 'speex' 'tdb' 'systemd' 'fftw' 'orc' 'libsamplerate'
         'webrtc-audio-processing' 'sbc' 'libasyncns' 'libxtst' 'libsm' 'libsndfile' 'json-c')
makedepends=('git' 'attr' 'avahi' 'bluez' 'gconf' 'intltool' 'jack' 'lirc-utils' 'openssl')
optdepends=('alsa-plugins: ALSA support'
            'avahi: zeroconf support'
            'bluez: bluetooth support'
            'gconf: configuration through gconf'
            'jack: jack support'
            'lirc-utils: infra-red support'
            'openssl: RAOP support'
            'python2-pyqt: Equalizer GUI (qpaeq)')
backup=(etc/pulse/{daemon.conf,default.pa,system.pa,client.conf})
provides=('pulseaudio' 'libpulse' 'pulseaudio-git')
conflicts=('pulseaudio' 'libpulse' 'pulseaudio-git')
replaces=('pulseaudio' 'libpulse' 'pulseaudio-git')
options=(!emptydirs !libtool)
source=("git+git://people.freedesktop.org/~jprvita/pulseaudio#branch=bluetooth-hf-audio-agent"
        "pulseaudio.xinit")
sha256sums=('SKIP'
         '3fb64aee43c482b3ea18e1b260c8f310884362b24bcd02a1c117dcd99237312f')
_gitname="pulseaudio"

pkgver() {
	cd "$srcdir/$_gitname"
	git describe --always | sed 's|-|.|g'
}

build() {
	cd "$srcdir/$_gitname"

	./autogen.sh  --prefix=/usr \
		--sysconfdir=/etc \
		--libexecdir=/usr/lib \
		--localstatedir=/var \
		--with-udev-rules-dir=/usr/lib/udev/rules.d \
		--with-database=tdb \
		--disable-hal-compat \
		--disable-rpath \
		--disable-tcpwrap \
		--disable-default-build-tests

	make
}

package() {
	cd "$srcdir/$_gitname"
	make DESTDIR="$pkgdir" install

	# Disable autospawn by default
	sed -e '/autospawn/iautospawn=no' -i "$pkgdir/etc/pulse/client.conf"

	# Speed up pulseaudio shutdown
	# Lower resample quality, saves CPU
	sed -e '/exit-idle-time/iexit-idle-time=0' -e '/resample-method/iresample-method=speex-float-0' -i "$pkgdir/etc/pulse/daemon.conf"

	# Disable cork-request module, can result in e.g. media players unpausing
	# when there's a Skype call incoming
	sed -e 's|/usr/bin/pactl load-module module-x11-cork-request|#&|' -i "$pkgdir/usr/bin/start-pulseaudio-x11"

	# Make ConsoleKit optional
	sed -e $'/load-module module-console-kit/{i.nofail\n;a.fail\n;}' -i "$pkgdir/etc/pulse/default.pa"

	# Python fix
	sed -i '1s:python$:&2:' "$pkgdir/usr/bin/qpaeq"

	install -Dm755 "$srcdir/pulseaudio.xinit" "$pkgdir/etc/X11/xinit/xinitrc.d/pulseaudio"

	rm "$pkgdir/etc/dbus-1/system.d/pulseaudio-system.conf"

	install -Dm644 shell-completion/pulseaudio-zsh-completion.zsh "$pkgdir/usr/share/zsh/site-functions/_pulseaudio"
}
