# Author:    tista <https://launchpad.net/~tista>
# Maintainer: sanderd17 <sanderd17 at gmail dot com>

pkgname=gnome-shell-theme-pantheon
pkgver=39
pkgrel=1
pkgdesc="A Gnome-Shell theme by tista. Based on the Elementary look." 
url="https://launchpad.net/~tista/+archive/gtk3"
license=('GPLv3')
arch=('any')
depends=('gnome-shell')
makedepends=('unzip')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
            'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("https://launchpad.net/~tista/+archive/gtk3/+files/gnome-shell-theme-pantheon_3.2.1-0ubuntu4%7Etista39.tar.gz")
md5sums=('847d1742c695512d87e1b83ed8dd3f79')


build() {
  mkdir -p ${pkgdir}/
  mv ${srcdir}/gnome-shell-theme-pantheon-3.2.1-0ubuntu4/usr ${pkgdir}/
}


