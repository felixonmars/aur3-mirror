# Maintainer: Mills00013 <Mills00013 at gmail dot com>
pkgname=gnome-shell-theme-default-mod
pkgver=1.9.1
pkgrel=5
pkgdesc="A GNOME Shell theme based on the stock GTK theme"
url="http://keiii-ru.deviantart.com/art/Default-Mod-292681255?"
license=('GPL')
arch=('any')
depends=('gnome-shell')
optdepends=('gnome-tweak-tool: Easy theme switcher')
source=('http://fc08.deviantart.net/fs70/f/2013/091/0/6/default_mod_by_keiii_ru-d4u96av.zip')
md5sums=('3532710f35481e3c943e059fe791bafd')
gversion=`/usr/bin/gnome-shell --version | sed -e 's/GNOME\sShell\s//g' | sed -e 's/\.[0-9]$//g'`



package() {
      cd "$srcdir"
        mkdir -p "$pkgdir/usr/share/themes"
      mv DefaultMod-$gversion "$pkgdir/usr/share/themes/DefaultMod"
      chmod -R 755 "$pkgdir/usr/share/themes/DefaultMod"
}
