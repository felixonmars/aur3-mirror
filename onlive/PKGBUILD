# Maintainer: felipe.facundes <felipe.facundes at gmail dot com>
# Contributor: felipe.facundes <felipe.facundes at gmail dot com
#

pkgname=onlive
pkgver=20110909
pkgrel=2
pkgdesc="OnLive is a company offering a cloud gaming platform and a cloud desktop system. Both offerings are synchronized, rendered, and stored on remote servers and delivered via the Internet. Your computer may be used to play any kind of game of the Windows."
arch=('any')
depends=('desktop-file-utils' 'fontconfig' 'freetype2' 'gcc-libs' 'gettext' 'glu' 'libsm' 'libxcursor' 'libxdamage' 'libxi' 'libxrandr' 'xorg-server')
makedepends=('tar')
optdepends=('alsa-lib' 'alsa-plugins' 'libcl' 'libjpeg-turbo' 'libldap' 'libpng' 'libpulse' 'libxcomposite' 'libxinerama' 'libxml2' 'mpg123' 'ncurses' 'openal' 'samba')
url="http://games.onlive.com/"
license=('GPL')
source=(
https://www.dropbox.com/s/htdpittrq038rhv/onlive.tar.xz)

build()
{
 cd "$srcdir"
 install -d "${pkgdir}/opt/"
 chmod +x onlive/bin/onlive
 chown -R $USER onlive
 cp -rf "onlive" "${pkgdir}/opt/" || return 1
 install -d "${pkgdir}/usr/share/applications/"
 cp -f OnLive.desktop "${pkgdir}/usr/share/applications/" || return 1
 install -d "${pkgdir}/usr/bin/"
 cp onlive/bin/onlive /usr/bin/onlive
 echo -e "run command:  chown -R $USER /opt/onlive"
 }

sha256sums=('7806b840be3de91c89fa19d8f78175077ab27ebf88758e6cea48a16d281fb2d6')