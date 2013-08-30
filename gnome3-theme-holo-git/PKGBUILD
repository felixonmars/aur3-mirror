# Contributor: Manuel Mendez <mmendez534@gmail.com>
# shamlessy copied from other AUR packages
# Maintainer : Mark Lee <mark@markelee.com>

## LOG :
## -----
## 08-29-2013: Bluerider has adopted the package and switched to the pacman4 git source methods
               cp statement was modified to copy everything in the source directory


pkgname=gnome3-theme-holo-git
pkgver=20130829
pkgrel=2
pkgdesc="A Gnome Shell, GTK[23], and Metacity theme from tiheum, the Faenza icon set creator, that mimics Ice Cream Sandwich (Android 4) theme."
url="http://tiheum.deviantart.com/art/Holo-280076980"
license=('GPL3')
arch=('any')
depends=('gtk-engine-murrine' 'gnome-themes-standard')
conflicts=('gtk-theme-holo' 'metacity-theme-holo' 'gnome-shell-theme-holo')
makedepends=('git')

_gitroot='https://github.com/gravitezero/Holo.git'
_gitname='Holo-Gnome3-Theme'

source=("$_gitname::git+$_gitroot")
md5sums=('SKIP')

package() {
    cd $srcdir/${_gitname};  ## enter the source directory

    mkdir -p "${pkgdir}/usr/share/themes/Holo";  ## make the package directory structure

    cp -rf * "${pkgdir}/usr/share/themes/Holo/"
}
