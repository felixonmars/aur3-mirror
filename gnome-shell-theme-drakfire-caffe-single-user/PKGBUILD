# Author:  Drakfire86 <http://drakfire86.deviantart.com/>
# Maintainer  sanderd17 < sanderd17 AT gmail DOT com >

pkgname=gnome-shell-theme-drakfire-caffe-single-user
pkgver=20110924
pkgrel=2
pkgdesc="This is a light brown GNOME Shell theme made by Drakfire. No system wide installation."
url="http://drakfire86.deviantart.com/art/Drakfire-Caffe-Shell-Theme-206462355"
license=('unknown')
arch=('any')
depends=('gnome-shell')
makedepends=('unzip')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
            'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("http://www.deviantart.com/download/206462355/drakfire_caffe_shell_theme_by_drakfire86-d3ex7df.zip")
DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 -H -U Mozilla -O %o %u')
md5sums=('65dbb528d424268c2c164a844641a048')

package() {
  mkdir -p ${pkgdir}/$HOME/.themes/drakfire-caffe/gnome-shell
  unzip drakfire_caffe_shell_theme_by_drakfire86-d3ex7df.zip -d ${pkgdir}/$HOME/.themes/drakfire-caffe/gnome-shell
  chmod 755 ${pkgdir}/$HOME/.themes/drakfire-caffe/gnome-shell
  mv ${pkgdir}/$HOME/.themes/drakfire-caffe/gnome-shell/theme/* ${pkgdir}/$HOME/.themes/drakfire-caffe/gnome-shell/
}


