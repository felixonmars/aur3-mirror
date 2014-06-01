# Maintainer: mareex <marcus dot behrendt dot 86 at gmail dot com>
# Contributor: vivaeltopo

_pkgname=gnome-shell-theme-viva
pkgname=gnome-shell-theme-viva-blue-git
pkgver=90
pkgrel=1
pkgdesc="Shell Theme for Gnome 3.x (Blue Version)"
arch=('any')
depends=('gnome-shell' 'ttf-impallari-raleway-family' 'ttf-opensans')
makedepends=('git')
url="https://github.com/vivaeltopo/gnome-shell-theme-viva/tree/viva-blue"
license=('Creative Commons by-nc-sa')
source=("git+https://github.com/vivaeltopo/gnome-shell-theme-viva.git")
md5sums=('SKIP')

pkgver() {
    cd $srcdir/$_pkgname
    git rev-list --count HEAD
}

prepare() {
    cd $srcdir/$_pkgname
    git checkout viva-blue
}

package() {
	mkdir -p $pkgdir/usr/share/themes/viva-blue/gnome-shell
	cp -dr -a --no-preserve=ownership $srcdir/$_pkgname/gnome-shell/* $pkgdir/usr/share/themes/viva-blue/gnome-shell/
}
