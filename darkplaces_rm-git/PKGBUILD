# Maintainer: J0k3r <moebius282 at gmail dot com>

pkgname=darkplaces_rm-git
pkgver=8943
pkgrel=1
pkgdesc="DarkplacesRM is a fork of the DarkPlaces engine compatible with the RocketMinsta project"
url="http://rocketminsta.net/"
license=('GPL2')
arch=('x86_64' 'i686')
depends=('sdl' 'libjpeg')
# additional depends of the glx version
depends+=('alsa-lib' 'libxpm' 'libxxf86vm')
optdepends=('libircclient: for irc support')
changelog="${pkgname}.changelog"
_local_repo="${pkgname}"
_binary_basename="darkplaces-rm"
source=("${_local_repo}::git+https://github.com/nexAkari/DarkPlacesRM.git"
        "${pkgname}.changelog")
sha256sums=("SKIP"
            "916618f24385b759f43f5140212c28aa763ec65138dcc6717b8c64d746a76763")

function pkgver
{
	cd "${srcdir}/${_local_repo}/"

	git rev-list --count HEAD
}

function build
{
	cd "${srcdir}/${_local_repo}/"

	make sv-release sdl-release cl-release
}

function package
{
	cd "${srcdir}/${_local_repo}/"

	install -d "${pkgdir}/usr/bin/"
	install -t "${pkgdir}/usr/bin/" "${_binary_basename}-dedicated" "${_binary_basename}-sdl" "${_binary_basename}-glx"
}
