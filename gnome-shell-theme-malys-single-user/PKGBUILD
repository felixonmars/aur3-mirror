## Author: ~malys777 <http://malys777.deviantart.com/>
# Maintainer  sanderd17 < sanderd17 AT gmail DOT com >

pkgname=gnome-shell-theme-malys-single-user
pkgver=1.02
pkgrel=1
pkgdesc="Malys GNOME Shell Theme"
url="http://malys777.deviantart.com/art/malys-GnomeShell-RC-1-02-211159321"
license=('cc-by-nc-sa-3.0')
arch=('any')
depends=('gnome-shell')
makedepends=('unzip')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
            'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=(http://www.deviantart.com/download/211159321/malys___gnomeshell___rc__1_02_by_malys777-d3hpvkp.zip)
DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 -H -U Mozilla -O %o %u')
md5sums=('2b29cbc79a1c4dbe34a9b757096ccd56')







package() {
  mkdir -p ${pkgdir}$HOME/.themes/Malys

  unzip -o malys___gnomeshell___rc__1_02_by_malys777-d3hpvkp.zip
  cp -R $srcdir/gnome-shell-theme-malys/malys/* $pkgdir$HOME/.themes/Malys/

  chmod -R 755 ${pkgdir}$HOME/.themes/Malys
}



