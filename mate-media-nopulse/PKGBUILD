pkgname=mate-media-nopulse
pkgver=2013.02.25
pkgrel=1
pkgdesc="MATE Media Tools"
arch=(i686 x86_64)
license=('GPL')
depends=('gstreamer0.10-base-plugins' 'mate-panel' 'libmatenotify')
provides=('mate-media')
conflicts=('mate-media')
replaces=('mate-media')
makedepends=('mate-doc-utils' 'pkgconfig' 'mate-settings-daemon' 'intltool' 'mate-icon-theme' 'libpulse' 'git' 'libtool')
groups=('mate-extras')
options=(!emptydirs !libtool)
url="http://mate-desktop.org/"
install=mate-media-nopulse.install
source=()
sha256sums=('9a2051c67bfdb9fc9dd2e55a3c0d733b4b230a3ef1d9c0a5bf2aac11ea068189')

_gitroot="git://github.com/mate-desktop/mate-media.git"
_prefix=/usr

build() {
    cd "${srcdir}"
    msg "Connecting to GIT server...."
	if [[ -d "${pkgname%}" ]]; then
		cd "${pkgname%}" && git pull origin
		msg "The local files are updated."
	else
		git clone "${_gitroot}" "${pkgname%}"
		cd "${pkgname%}"
  	fi

  	msg "GIT checkout done or server timeout"
  	msg "Starting build..."

	#build


	# Optional Features:
	#    --enable-pulseaudio     Enable PulseAudio support [default=auto]
	#    --enable-profiles       enable mate media profiles
	#    --enable-grecord        enable mate sound recorder
	#    --enable-gstprops       enable gstreamer properties
	#    --enable-gstmix         enable gstreamer mixer
	./autogen.sh \
		--prefix=/usr \
		--sysconfdir=/etc \
		--libexecdir=/usr/lib/${pkgname} \
		--localstatedir=/var --disable-static \
		--disable-schemas-install \
		--disable-scrollkeeper \
		--disable-pulseaudio \
		--enable-profiles \
		--enable-grecord \
		--enable-gstprops \
		--enable-gstmix || return 1

	make || return 1
}

package() {
	cd "${srcdir}/${pkgname}"

	make MATECONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install || return 1
	#rm -f ${pkgdir}/usr/lib/*.la # can be used options=(!libtools)

	install -m755 -d "${pkgdir}/usr/share/mateconf/schemas"
	mateconf-merge-schema "${pkgdir}/usr/share/mateconf/schemas/${pkgname}.schemas" --domain ${pkgname} ${pkgdir}/etc/mateconf/schemas/*.schemas || return 1
	rm -f ${pkgdir}/etc/mateconf/schemas/*.schemas
}
