# Maintainer: mareex <marcus.behrendt.86@gmail.com>

pkgname=gnome-shell-theme-nova
pkgver=0.7
pkgrel=1
pkgdesc="A Gnome-Shell Theme for version 3.10"
arch=('any')
url="http://gnome-look.org/content/show.php/NovaShell?content=151522"
license=('GPL')
depends=('gnome-shell>=3.10' 'gnome-shell<3.12')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=('http://gnome-look.org/CONTENT/content-files/151522-NovaShell.zip')
sha256sums=('e11400c6a65190756e612ff817014ab0297e5af55c9c8ccdaecd734fdfc050bf')


package() {
  mkdir -p $pkgdir/usr/share/themes/NovaShell/gnome-shell
  cd $srcdir/NovaShell
  install -m0644 gnome-shell/* "$pkgdir/usr/share/themes/NovaShell/gnome-shell"
}
