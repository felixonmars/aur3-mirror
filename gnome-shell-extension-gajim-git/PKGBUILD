# Contributor: Sebastian Lenz <sebastian@archusers.de>
# Maintainer: Bjoern Franke <bjo@nord-west.org>
pkgname=gnome-shell-extension-gajim-git
pkgver=20130410
pkgrel=1
pkgdesc="Integration with Gajim, a Jabber/XMPP instant messaging 
client."
arch=('i686' 'x86_64')
url="http://live.gnome.org/GnomeShell/Extensions"
license=('GPL' 'LGPL')
depends=('gnome-shell-extension-common-git')
makedepends=('git' 'gnome-common' 'intltool')
conflicts=('gnome-shell-extensions-git')
_gitroot="git://git.gnome.org/gnome-shell-extensions"
_gitname="gnome-shell-extensions"
_gittag="3.6.2"
 
build() {
msg "Connecting to GIT server...."
 
if [ ! -d "${srcdir}/${_gitname}" ]; then
git clone "$_gitroot" --depth=1 -q -b "$_gittag" "${srcdir}/${_gitname}"
fi
 
msg "GIT checkout done or server timeout"
msg "Starting make..."
 
cd "${srcdir}/${_gitname}"
./autogen.sh --prefix=/usr --enable-extensions="gajim"
}
 
package() {
cd "${srcdir}/${_gitname}"
make DESTDIR=${pkgdir} install
rm -r ${pkgdir}/usr/share/locale
}
