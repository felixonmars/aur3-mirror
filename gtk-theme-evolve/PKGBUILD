# Maintainer: Lucain
pkgname=gtk-theme-evolve
pkgver=2013.10.30
pkgrel=1
pkgdesc="A simple and minimal light theme designed to be easy on the eyes. Supports Gnome Shell, Unity, Pantheon and Xfce."
url="http://satya164.deviantart.com/art/Evolve-GTK3-Theme-264780816"
license=('GPLv3')
arch=('any')
depends=('gtk-engine-murrine')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=('http://fc04.deviantart.net/fs71/f/2013/302/4/7/evolve___gtk3_theme_by_satya164-d4dn66o.zip')
md5sums=('e1ca51300c09165b3c1f7af53e8f7cef')

package() {
    cd "$srcdir/"
    mkdir -p "$pkgdir/usr/share/themes/Evolve"
    cp -r Evolve/*  "$pkgdir/usr/share/themes/Evolve/"
    chmod -R 755 "$pkgdir/usr/share/themes/Evolve/"
} 

