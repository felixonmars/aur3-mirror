# Maintainer: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com
#
# Copy libflashplayer.so, eg /usr/lib/mozilla/plugins/libflashplayer.so 
# to a user writable location first, eg. ~/
#
# Usage: flash-fullscreen-patcher.sh
# -g -- gui mode
# -f <plugin> -- remove ESC message
# -i <plugin> -- ignore mouse clicks in other monitor in multi monitor setups
#
pkgname=flash-fullscreen-patcher
pkgver=3.0
pkgrel=2
pkgdesc='Remove the annoying "Press Esc to exit full screen..." from (pepper/chrome) flash videos and improvements in multimonitor setups'
arch=('i686' 'x86_64')
url="http://forum.videohelp.com/threads/304807-How-to-remove-annoying-Press-Esc-to-message-in-Flash-Video"
license=('custom:free to use')
depends=('wine')
options=(!strip)
source=("${pkgname}.zip::https://www.dropbox.com/s/ssrlsnx1csdyc8p/Flash%20Fullscreen%20Patcher%20v3.00%20%2B%20Source.zip?dl=1"
		"${pkgname}.sh")

md5sums=('35b6078b004c51675c1ebc51a3bf5e75'
         'b0f51fb5faa4a1a8b8480628ef23cd96')

package() {
  # install exe file
  install -Dm644 "$srcdir/Flash Fullscreen Patcher.exe" "$pkgdir"/usr/share/${pkgname}/${pkgname}.exe
  # Install the bash script
  install -Dm755 "${srcdir}"/${pkgname}.sh "${pkgdir}"/usr/bin/${pkgname}
}
