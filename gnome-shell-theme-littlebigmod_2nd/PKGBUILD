# Author: txen <http://gnome-look.org/content/show.php/LittleBigMod_2nd+%28RC1%29?content=152088>
# Maintainer: jackgu1988 <jack dot gurulian at gmail dot com>

pkgname=gnome-shell-theme-littlebigmod_2nd
pkgver=1.5
pkgrel=1
pkgdesc="A nice theme for Gnome Shell 3.4"
url="http://gnome-look.org/content/show.php/LittleBigMod_2nd+%28RC1%29?content=152088"
license=('GPL')
arch=('any')
depends=('gnome-shell')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
            'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("http://www.deviantart.com/download/330974896/littlebigmod_2nd___gnome_shell_theme__v3_4__by_convme-d5h1xv4.zip")
md5sums=('4d90dcdff81b9cdcaf39e5ed7d4955f3')

package() {
  msg "Installing theme to /usr/share/themes/LittleBigMod_2nd"
  find "LittleBigMod_2nd"*/ -not -name "*~" -type f \
      -exec install -vDm644 "{}" "$pkgdir/usr/share/themes/{}" \;
}
