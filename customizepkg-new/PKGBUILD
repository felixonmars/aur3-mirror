# Author: wain <wain.at.archlinux.fr>
# Contributor: Aliaksandr Stelmachonak a.k.a. ava1ar <mail.avatar.at.gmail.com>
# Contributor: Stefan Husmann <stefan-husmann.at.t-online.de>

pkgname=customizepkg-new
_realname=customizepkg
pkgver=0.6.1
pkgrel=1
pkgdesc="A tool to modify automatically PKGBUILD (further development of customizepkg)" 
url="http://www.archlinux.fr/" 
license=('GPL')
arch=('any')
depends=('bash') 
source=(https://dl.dropboxusercontent.com/u/4514366/AUR/${_realname}.tar.bz2) 
sha1sums=('690ca4cdc0a71a0d5444406c4d809c5c78be3950')

package() { 
	cd ${srcdir}/${_realname}
	install -D -m 755 ${_realname} ${pkgdir}/usr/bin/${_realname}
	mkdir -p ${pkgdir}/etc/customizepkg.d/
	cp -R *.example ${pkgdir}/etc/customizepkg.d/ 
}
