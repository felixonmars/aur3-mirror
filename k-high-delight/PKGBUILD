# Maintainer: felipe.facundes <felipe dot facundes at gmail dot com>
# Contributor: Berseker <berseker86 at gmail dot com
# Based on PKGBUILD by facundes <felipe dot facundes at gmail dot com>

pkgname=k-high-delight
pkgver=8.10.25
pkgrel=1
pkgdesc="K-High-Delight is a colorful icons set compatible with most light GTK and Qt themes."
arch=('any')
makedepends=('tar' 'xorg-server')
optdepends=('gnome-icon-theme: GNOME icon theme')
url="https://opendesktop.org/content/show.php?content=159497"
license=('GPL')
source=(
#https://cloud.mail.ru/public/b848097eed08/K-High-Delight_8.10.25.tar.gz
https://www.dropbox.com/s/35rytp92mmyr4qa/K-High-Delight_8.10.25.tar.gz)

package()
{
 cd "$srcdir"
 install -d 755 "${pkgdir}/usr/share/icons/"
 chmod -R 755 K-High-Delight
 cp -rf K-High-Delight "${pkgdir}/usr/share/icons/" || return 1
 find -type f -print0 | xargs -0 chmod 644
}

md5sums=('888b79fb7768a69d22122a3fbf9423c1')
