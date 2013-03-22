# Maintainer: glaucous <glakke1 at gmail dot com>

pkgname=lightdm-webkit-theme-bevel-git
pkgver=20130317
pkgrel=1
pkgdesc="A minimal theme for the LightDM Webkit greeter"
arch=('any')
url="http://blender3d.github.com/Bevel/"
license=('GPLv2')
depends=('lightdm-webkit-greeter')
install=lightdm-webkit-theme-bevel-git.install
source=('session.patch')
md5sums=('7be6b289e28cebf35d934967164ac3c2')

_gitroot='git://github.com/Blender3D/Bevel.git'
_gitname='bevel'

build()
{
	cd ${srcdir}
	msg "Connecting to GIT server...."

	if [[ -d "${_gitname}" ]]; then
		cd "${_gitname}" && git pull origin
		msg "The local files are updated."
	else
		git clone "${_gitroot}" "${_gitname}"
	fi

	msg "GIT checkout done or server timeout"
	msg "Applying session patch"
	patch -p0 < session.patch
}

package()
{
	cd ${pkgdir}
	mkdir -p usr/share/lightdm-webkit/themes
	cd usr/share/lightdm-webkit/themes
	cp -dpr --no-preserve=ownership ${srcdir}/${_gitname} .
	msg "Removing .git files"
	rm -rf ${_gitname}/.git
}
