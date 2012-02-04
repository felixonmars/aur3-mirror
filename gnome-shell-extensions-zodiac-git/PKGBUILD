#Contributor: Miguel Aguilar <zodiac_es@yahoo.es>

pkgbase=gnome-shell-extensions-zodiac-git
pkgver=20110710
pkgrel=2
arch=(any)

#depends=('gnome-shell' 'gtk3')
depends=(gnome-shell-extensions-zodiac-common-git \
         gnome-shell-extension-zodiac-activitiesbutton-git \
         gnome-shell-extension-zodiac-autohidetopbar-git \
         gnome-shell-extension-zodiac-autohidedock-git \
         gnome-shell-extension-zodiac-icon-manager-git \
         gnome-shell-extension-zodiac-moveclock-git)

url="http://github.com/zodiac66/shell-extensions-zodiac"
license=(GPL2)

makedepends=('intltool' 'gnome-doc-utils' 'git' 'gnome-common')

pkgname=gnome-shell-extensions-zodiac-git

_gitroot="git://github.com/zodiac66/shell-extensions-zodiac"
_gitname="shell-extensions-zodiac"

install=shell-extensions-zodiac-git.install
options=(!libtool !emptydirs)

#PKGBUILD specific functions

build() {

    cd ${srcdir}/

}

package () {
  pkgdesc="Zodiac Extensions for GNOME Shell - activitiesbutton, autohidetopbar, autohidedock, icon-manager, moveclock"

}

