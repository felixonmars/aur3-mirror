pkgname=veetleplugin
pkgver=0.9.17+
pkgrel=1
pkgdesc="Veetle plugin to play live streams in your web browser"
arch=('i686' 'x86_64')
url="http://forums.veetle.com/questions/1299/why-doesnt-the-plugin-work-on-linux-64-bit-andor-audio-sync-issues"
license=('Custom')
replaces=('veetle')
if [[ "$CARCH" == 'i686' ]]; then
	depends=(gcc-libs glibc libxv libsm libice libx11 libxext libgl mesa sdl alsa-lib pulseaudio libpulse)
elif [[ "$CARCH" == 'x86_64' ]]; then
	depends=(gcc-libs glibc lib32-gcc-libs lib32-glibc lib32-libxv lib32-libsm lib32-libice lib32-libx11 lib32-libxext lib32-libgl lib32-mesa lib32-sdl lib32-alsa-lib pulseaudio libpulse lib32-libpulse)
fi
source=(http://veetle.com/download.php/veetle-0.9.17plus.tgz)
md5sums=(74fc2122bb667aa76bb0532069ae6994)

package () {
	cd "${srcdir}/veetle-0.9.17"
	sed -i -b -e 's|'%s/.veetle_vlc/vlc'|'/opt/veetle_vlc/v_'|g' libveetle-player-plugin*
	if [[ "$CARCH" == 'i686' ]]; then
		install -Dm644 libveetle-core-plugin.so "${pkgdir}/usr/lib/mozilla/plugins/libveetle-core-plugin.so"
		install -Dm644 libveetle-player-plugin.so "${pkgdir}/usr/lib/mozilla/plugins/libveetle-player-plugin.so"
	elif [[ "$CARCH" == 'x86_64' ]]; then
		install -Dm644 libveetle-core-plugin-x86_64.so "${pkgdir}/usr/lib/mozilla/plugins/libveetle-core-plugin-x86_64.so"
		install -Dm644 libveetle-player-plugin-x86_64.so "${pkgdir}/usr/lib/mozilla/plugins/libveetle-player-plugin-x86_64.so"
	fi
	install -d "$pkgdir/opt/veetle_vlc"
	install -Dm755 vlc "$pkgdir/opt/veetle_vlc/v_"
	install -Dm755 vlcori "$pkgdir/opt/veetle_vlc/vlcori"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
