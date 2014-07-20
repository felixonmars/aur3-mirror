# Maintainer: Greygjhart <greg+devel@marvid.fr>
# This theme was found on gnome-look.org and was submitted by spootonium. Thanks to him for the great work

pkgname=elemint-icon-theme
themeName=EleMint
pkgver=0.7beta
pkgrel=1
pkgdesc="The goal of EleMint is to expand the variety of available icons for Elegant Brit, injecting a little more colour and energy, while staying true to the graphic style and restricted palette."
arch=('any')
site_url="http://gnome-look.org"
url="${site_url}/content/show.php/EleMint+Icon+Theme?content=165866"
license=('CC BY-SA')
source=("${site_url}/CONTENT/content-files/165866-EleMint-0.7b.tar.gz")
md5sums=('b3feba4da8324b49f578cccc768a49d4')

prepare() {
	find ${srcdir} -type d ! -perm 755 -exec chmod 755 {} +
	find ${srcdir} -type f ! -perm 644 -exec chmod 644 {} +
}

package() {
	mkdir -p ${pkgdir}/usr/share/icons/
	cp -dr --no-preserve=ownership ${srcdir}/EleMint ${pkgdir}/usr/share/icons/
}

