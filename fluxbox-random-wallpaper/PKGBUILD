# Maintainer: felipe.facundes <felipe.facundes at gmail dot com>
# Contributor: felipe.facundes <felipe.facundes at gmail dot com
#

pkgname=fluxbox-random-wallpaper
pkgver=1.3
pkgrel=1
pkgdesc="fluxbox-random-wallpaper is a random wallpaper set compatible with fluxbox."
arch=('any')
depends=('feh' 'fluxbox' 'xorg-server')
makedepends=('tar')
optdepends=('imagemagick: image viewing/manipulation')
url="http://www.slackbr.org/forum/viewtopic.php?f=45&t=16269"
license=('GPL')
source=(
https://www.dropbox.com/s/mcf5f9tpxj1q99o/fluxbox-random-wallpaper.tar.gz)

build()
{
 cd "$srcdir"
 install -d "${pkgdir}/usr/bin/"
 chmod +x fluxbox-random-wallpaper
 cp fluxbox-random-wallpaper "${pkgdir}/usr/bin/" || return 1
 mkdir -p /home/$USER/.fluxbox-random-wallpaper/Wallpapers
 install -d "${pkgdir}/home/$USER/.fluxbox-random-wallpaper/Wallpapers"
 cp -f *.jpg "${pkgdir}/home/$USER/.fluxbox-random-wallpaper/Wallpapers" || return 1
 ln -sf /home/$USER/.fluxbox-random-wallpaper/Wallpapers /home/$USER/Fluxbox-Random-Wallpaper
 chown -R $USER /home/$USER/.fluxbox-random-wallpaper/
 chgrp -R $USER /home/$USER/.fluxbox-random-wallpaper/
 chmod -R g+w /home/$USER/.fluxbox-random-wallpaper/
 echo -e "include command: fluxbox-random-wallpaper & 		(on) /home/$USER/.fluxbox/startup"
 }

sha256sums=('be19c134830b06ae2f633e3eb94dbd2cfaf025e2a7b6fefaebb01c8e970973b2')