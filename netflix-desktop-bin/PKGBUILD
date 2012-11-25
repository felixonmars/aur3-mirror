# Maintainer: Jesus Alvarez <jeezusjr@gmail.com>
# Contributor: sxe <sxxe@gmx.de>
# Based on the wine-git in AUR

pkgname='netflix-desktop-bin'
pkgver=0.1.0
_pkgname='netflix-desktop'
_pkgpre='0.1.0~quantal8'
pkgrel=1
pkgdesc="Netflix on Linux via WINE."
url="https://launchpad.net/~ehoover/+archive/compholio/"
arch=('x86_64')
license=('LGPL')
depends=('wine-compholio-bin' 'ttf-ms-fonts' 'zenity')

# netflix-desktop_0.1.0~quantal8_amd64.deb
_url="https://launchpad.net/~ehoover/+archive/compholio/+files"
_deb="${_pkgname}_${_pkgpre}_amd64.deb"
source=("${_url}/${_deb}"
"SilverlightSetup.exe::http://silverlight.dlservice.microsoft.com/download/6/A/1/6A13C54D-3F35-4082-977A-27F30ECE0F34/10329.00/runtime/Silverlight.exe"
"FirefoxSetup.exe::http://download.mozilla.org/?product=firefox-14.0.1-funnelcake13&os=win&lang=en-US"
"NetflixIcon.png::http://developer.netflix.com/files/Netflix_API2_57x57.png")
md5sums=('ec5c040008a47ffa372720d0f8d34f69'
         '30dafa3816b53b576436d841d163f8dc'
         '14a519070ae6244cec64307445bfc58e'
         '0a4c2ef50831a751dae74315eb066c01')

build() {
    msg2 "Extracting files..."
    cd "$srcdir"
    ar x ${_deb}
    tar xf data.tar.gz -C $pkgdir
    # msg2 "Making it nice..."
    # mkdir -p $pkgdir/usr/share/licenses/${pkgname}
    # ln -s /usr/share/doc/${_pkgname}/copyright $pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt
}

package() {
  install -Dm644 $srcdir/FirefoxSetup.exe $pkgdir/usr/share/netflix-desktop/FirefoxSetup.exe
  install -Dm644 $srcdir/SilverlightSetup.exe $pkgdir/usr/share/netflix-desktop/SilverlightSetup.exe
  install -Dm644 $srcdir/NetflixIcon.png $pkgdir/usr/share/netflix-desktop/NetflixIcon.png
}

# vim:set ts=2 sw=2 et:
