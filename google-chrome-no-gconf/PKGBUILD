# Maintainer: taylorchu

pkgname=google-chrome-no-gconf
pkgver=stable   # update  Check for new Linux releases in: http://googlechromereleases.blogspot.com/search/label/Dev%20updates
pkgrel=1
pkgdesc="Official build of Google Chrome From Google with minimal dependency"
arch=('i686' 'x86_64')
url="http://www.google.com/chrome"
license=('custom:chrome')
depends=('gtk2' 'no-gconf' 'dbus-glib' 'nss' 'alsa-lib' 'xdg-utils'
         'libxss' 'libgcrypt' 'desktop-file-utils' 'hicolor-icon-theme')
provides=('google-chrome')
conflicts=('google-chrome')


if [ "$CARCH" = "i686" ]; then
    _arch='i386'
elif [ "$CARCH" = "x86_64" ]; then
    _arch='x86_64'
fi

package() {
    
    wget -O cr.rpm "http://dl.google.com/dl/linux/direct/google-chrome-${pkgver}_current_${_arch}.rpm"
    bsdtar xvf cr.rpm

    # keep data clean
    cp -r usr "$pkgdir"
    cp -r opt "$pkgdir"

    # fix chrome-sandbox permission
    chmod 4755 "$pkgdir/opt/google/chrome/chrome-sandbox"	

    msg2 "chrome-install ok"
}
