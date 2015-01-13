# Maintainer: felipe.facundes <felipe dot facundes at gmail dot com>
# Contributor: Berseker <berseker86 at gmail dot com
# Based on PKGBUILD by facundes <felipe dot facundes at gmail dot com>

pkgname=win7-lookalike-icons-theme
pkgver=2011.04.05
pkgrel=2
pkgdesc="Win7-Lookalike is a colorful icons set compatible with most light GTK and Qt themes."
arch=('any')
makedepends=('tar' 'xorg-server')
optdepends=('gnome-icon-theme: GNOME icon theme')
url="http://kde-look.org/content/show.php/Win.7.icon.theme.lookalike?content=137250"
license=('GPL')
source=(
#http://serveradm.ru/wp-content/uploads/2011/09/Win7.Lookalike.2011.04.05.tar.gz
https://www.dropbox.com/s/0377aff0nlk5c2e/Win7.Lookalike.2011.04.05.tar.gz)

package()
{
 cd "$srcdir"
 install -d 755 "${pkgdir}/usr/share/icons/"
 chmod -R 755 Win7.Lookalike.2011.03.08
 cp -rf Win7.Lookalike.2011.03.08 "${pkgdir}/usr/share/icons/" || return 1
 find -type f -print0 | xargs -0 chmod 644
}

md5sums=('5892a9fe3a4671042b2fd47153cedf42')
