# Contributor: vbPadre <vbpadre@gmail.com>

pkgname=kdm-theme-lucid
pkgver=0.2.2
pkgrel=1
pkgdesc="KDM theme for KDE 4.x looks like Kubuntu Lucid (kde-look.org)"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php?action=content&content=123845"
license=('gpl')
depends=()
makedepends=()
source=('http://kde-look.org/CONTENT/content-files/123845-Kubuntu Lucid Classic.tar.gz' 'logo.png')
md5sums=('a78fbdb738df9f86cd5f66e95d9a728a' '8b47a0bdd107e64789670e04d1fb2517')

build() {

  cd ${startdir}/src/
  cp -f logo.png 'Kubuntu Lucid Classic'
  mkdir -p $pkgdir/usr/share/apps/kdm/themes
  mv 'Kubuntu Lucid Classic'/ $pkgdir/usr/share/apps/kdm/themes

}
 