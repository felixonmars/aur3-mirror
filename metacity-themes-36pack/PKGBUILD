# Maintainer: Rob McCathie <korrode AT gmail>

pkgname=metacity-themes-36pack
pkgver=20150517
pkgrel=1
pkgdesc="36 original metacity themes"
arch=('any')
url="http://gnome-look.org/content/show.php?content=167569"
license=('CCPL')
source=("https://www.dropbox.com/s/oreosvkxjugnkxh/Metacity 36 Pack.tar.gz")
sha1sums=('27171d570fa7b43b4a1f112cd6a1111a97d2bb5a')
options=('!strip')

package() {
  mkdir -p "${pkgdir}/usr/share/themes"
  cp -r "${srcdir}/Metacity 36 Pack/"* "${pkgdir}/usr/share/themes"
}
