# Maintaner: Neale Pickett <neale@woozle.org>
#
# Original Maintainer: polslinux <admin(at)polslinux(dot)it>
# Original Contributor: ava1ar <mail(at)ava1ar(dot)info>

####
#### This package gets out of date quickly.
#### If this happens to you, the following command will provide the current value for pkgver.
#### Be a pal and run "makepkg --source" then upload the resulting .src.tar.gz to the AUR.
####
# <curl -s https://dl.google.com/linux/chrome/rpm/stable/x86_64/repodata/other.xml.gz | zcat | awk -F\" '/-stable/{print $10}' | tr -d '\n'
pkgver=32.0.1700.107

pkgname=chromium-plugins-stable
pkgdesc="Google Chrome's PDF and Pepper Flash plugins for Chromium (stable version)"
pkgrel=1
epoch=1
arch=('i686' 'x86_64')
url="http://www.google.com/chrome"
license=('custom:chrome')
depends=('chromium')
optdepends=('pulseaudio-alsa: For PulseAudio users')
install=chromium-plugins.install

# Ask Google what the most current version is
gchan=stable
case "$CARCH" in
    x86_64) garch=x86_64 ;;
    i686) garch=i386 ;;
    *) echo "Error: unknown architecture $CARCH" 1>&2; exit 1 ;;
esac
gver=${pkgver}-1

source=(license.html::http://www.google.com/chrome/intl/en/eula_text.html)
source+=(https://dl.google.com/linux/chrome/rpm/stable/$garch/google-chrome-${gchan}-$gver.${garch}.rpm)
sha1sums=('SKIP' 'SKIP')

package() {
    install -d "${pkgdir}/usr/lib/chromium"
    install -m644 opt/google/chrome/libpdf.so "${pkgdir}/usr/lib/chromium"
    install -d "${pkgdir}/usr/lib/PepperFlash"
    install -m644 opt/google/chrome/PepperFlash/* "${pkgdir}/usr/lib/PepperFlash"
	flashver=$(awk -F '[": ,]+' '/version/ {print $3;}' ${srcdir}/opt/google/chrome/PepperFlash/manifest.json)
    sed -i "s/flashver=.*/flashver=${flashver}/" "${startdir}/chromium-plugins.install"
    install -Dm644 "${srcdir}/license.html" "${pkgdir}/usr/share/licenses/${pkgname}/license.html"
}
