# Maintainer: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: dejavu <pauli8585@hotmail.com>
# Contributor: dieghen89 <dieghen89@gmail.com>

pkgname=veetle
pkgver=0.9.17+
pkgrel=4
pkgdesc="Official Player (using the 0.9.17plus version for better x86_64 and pulseaudio support)"
arch=('i686' 'x86_64')
url="http://www.veetle.com"
license=('Custom')
install=${pkgname}.install
#source=(http://veetle.com/download.php/veetle-${pkgver}.tgz)
source=(http://veetle.com/download.php/veetle-0.9.17plus.tgz)
md5sums=(74fc2122bb667aa76bb0532069ae6994)

if [[ "$CARCH" == 'i686' ]]; then
   depends=(glibc gcc-libs libxv libsm libice libx11 libxext libgl mesa sdl alsa-lib util-linux libxcb libxdamage libxfixes libxxf86vm libdrm libxau libxdmcp)
elif [[ "$CARCH" == 'x86_64' ]]; then
   depends=(lib32-glibc lib32-gcc-libs lib32-libxv lib32-libsm lib32-libice lib32-libx11 lib32-libxext lib32-libgl lib32-mesa lib32-sdl lib32-alsa-lib lib32-util-linux lib32-libxcb lib32-libxdamage lib32-libxfixes lib32-libxxf86vm lib32-libdrm lib32-libxau lib32-libxdmcp lib32-glu)
fi

build() {
cd "${srcdir}/veetle-0.9.17"
sed -i 's/--aout oss/--alsadev 0/g' vlc
}

package() {
install -d "${pkgdir}/opt/${pkgname}" "${pkgdir}/usr/lib/mozilla/plugins"
install -D -m644 "${srcdir}/veetle-0.9.17/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
install -D -m755 "${srcdir}"/veetle-0.9.17/vlc* "${pkgdir}/opt/${pkgname}"

if [[ "$CARCH" == 'i686' ]]; then
   install -D -m644 "${srcdir}/veetle-0.9.17/libveetle-core-plugin.so" "${pkgdir}/usr/lib/mozilla/plugins"
   install -D -m644 "${srcdir}/veetle-0.9.17/libveetle-player-plugin.so" "${pkgdir}/usr/lib/mozilla/plugins"
elif [[ "$CARCH" == 'x86_64' ]]; then
   install -D -m644 "${srcdir}/veetle-0.9.17/libveetle-core-plugin-x86_64.so" "${pkgdir}/usr/lib/mozilla/plugins"
   install -D -m644 "${srcdir}/veetle-0.9.17/libveetle-player-plugin-x86_64.so" "${pkgdir}/usr/lib/mozilla/plugins"
fi

ln -s /tmp "${pkgdir}/opt/${pkgname}/cache"
}
