# Maintainer: felipe.facundes <felipe.facundes at gmail dot com>
# Contributor: felipe.facundes <felipe.facundes at gmail dot com
#

pkgname=lxde-random-wallpaper
pkgver=7.9
pkgrel=1
pkgdesc="lxde-random-wallpaper is a random wallpaper set compatible with lxde."
arch=('any')
depends=('libfm' 'lxappearance' 'xorg-server' 'lxde-common' 'pcmanfm' 'lxinput' 'lxsession')
makedepends=('tar')
optdepends=('lxde-icon-theme: lxde icon themes')
url="https://sites.google.com/site/felipefacundes/"
license=('GPL')
source=(
https://www.dropbox.com/s/9k3gu32eihavorn/lxde-random-wallpaper.tar.gz)

build()
{
 cd "$srcdir"
 install -d "${pkgdir}/etc/xdg/autostart/"
 cp -rf "lxde-random-wallpaper.desktop" "${pkgdir}/etc/xdg/autostart/" || return 1
 install -d "${pkgdir}/usr/bin/"
 chmod +x lxde-random-wallpaper
 cp -rf "lxde-random-wallpaper" "${pkgdir}/usr/bin/" || return 1
 mkdir -p /home/$USER/.lxde-random-wallpaper/Wallpapers
 install -d "${pkgdir}/home/$USER/.lxde-random-wallpaper/Wallpapers"
 cp -f *.jpg "${pkgdir}/home/$USER/.lxde-random-wallpaper/Wallpapers" || return 1
 ln -sf /home/$USER/.lxde-random-wallpaper /home/$USER/Random-Wallpaper
 chown -R $USER /home/$USER/.lxde-random-wallpaper/
 chgrp -R $USER /home/$USER/.lxde-random-wallpaper/
 chmod -R g+w /home/$USER/.lxde-random-wallpaper/
 }

sha256sums=('86021475ede2c42785947313e8e2408e8cddbeb4617900a961516dc3708a64ee')