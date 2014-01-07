# Maintainer: felipe.facundes <felipe.facundes at gmail dot com>
# Contributor: felipe.facundes <felipe.facundes at gmail dot com
#

pkgname=onlive-permissions
pkgver=1.0
pkgrel=1
pkgdesc="onlive-permissions gives their permission to onlive. OnLive is a company offering a cloud gaming platform and a cloud desktop system. Both offerings are synchronized, rendered, and stored on remote servers and delivered via the Internet."
arch=('any')
depends=('onlive' 'xorg-server')
makedepends=('tar')
url="http://games.onlive.com/"
license=('GPL')
source=(
readme-for-permissions.txt)

build()
{
 cd "$srcdir"
 install -d "${pkgdir}/opt/onlive/"
 cp readme-for-permissions.txt /opt/onlive/
 chmod +x /opt/onlive/bin/onlive
 chmod +x /usr/bin/onlive
 chown -R $USER /opt/onlive/
 chgrp -R $USER /opt/onlive/
 chmod -R g+w /opt/onlive/
 }

sha256sums=('6045ff9026e202b27b2eb580377a2522a442825397dcfec3de1d5ff796e44a05')