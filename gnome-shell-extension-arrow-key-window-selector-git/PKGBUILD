# Maintainer: foalsrock <foalsrock at gmail dot com>

pkgname=gnome-shell-extension-arrow-key-window-selector-git
pkgver=20110711
pkgrel=1
pkgdesc="GNOME Shell extension for selecting windows in overview mode with arrow key."
arch=('any')
url="https://github.com/tanwald/gnome-shell-extension-arrow-key-window-selector"
license=('unknown')
depends=('gnome-shell')
makedepends=('git')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
_gitroot="https://github.com/tanwald/gnome-shell-extension-arrow-key-window-selector"
_gitname="gnome-shell-extension-arrow-key-window-selector"

package() {
cd ${srcdir}
 msg "Connecting to GIT server...."

if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
else
    git clone $_gitroot
fi

mkdir -p ${pkgdir}/usr/share/gnome-shell/extensions/arrow-key-window-selector@tanwald.net
mv ${srcdir}/gnome-shell-extension-arrow-key-window-selector/*.js* ${pkgdir}/usr/share/gnome-shell/extensions/arrow-key-window-selector@tanwald.net/
}