# Maintainer: Matthew Stobbs <matthew@stobbstechnical.com>

_pkgname=lightdm-webkit-archlinux-theme
pkgname=$_pkgname-git
pkgver=20140604
pkgrel=1
pkgdesc="Archlinux theme for LightDM Webkit"
arch=('i686' 'x86_64')
url="https://github.com/stobbsm/lightdm-webkit-archlinux-theme"
license=("GPL2")
depends=('lightdm-webkit-greeter')
makedepends=('git')
providers=("$_pkgname")
conflicts=("$_pkgname")
source=("git://github.com/stobbsm/lightdm-webkit-archlinux-theme.git#branch=add_session_chooser")
sha256sums=("SKIP")

package() {
	mkdir -p "$pkgdir"/usr/share/lightdm-webkit/themes/
	cp -r "$srcdir/$_pkgname" "$pkgdir"/usr/share/lightdm-webkit/themes/arch
}
