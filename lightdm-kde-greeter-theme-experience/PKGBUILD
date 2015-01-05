# NOTE: The theme was modified by lctrgk to work on Arch and other distos.

pkgname=lightdm-kde-greeter-theme-experience
_realname=Experience
pkgver=1.0
pkgrel=3
pkgdesc="LightDM KDE greeter theme, modified by lctrgk"
arch=('any')
url="http://kde-look.org/content/show.php/?content=158898"
license=('GPL')
depends=('lightdm-kde-greeter')
source=("https://content.wuala.com/contents/lctrgk/WualaSync/Compartidos/Arch_repo/Experience_lct2.tar.gz/?dl=1")
sha256sums=('20f4a004cfbba25d8b7e9a55f29aa304d0a3914bf37a87e1226c6c59f987f260')

prepare() {
  cd "$srcdir/$_realname"
  # rm not needed stuff
  rm theme.desktop{.old,1}
}

package() {
  cd "$srcdir"
  mkdir -p $pkgdir/usr/share/apps/lightdm-kde-greeter/themes
  mv $_realname $pkgdir/usr/share/apps/lightdm-kde-greeter/themes/
}
