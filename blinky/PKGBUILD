# pkgbuild made by hunterm <hunterm.haxxr at gmail dot com>

pkgname=blinky
pkgver=20101110
pkgrel=1
pkgdesc="A GUI for pacman and the AUR made in Bash!"
arch=('any')
url="http://github.com/hunterm/blinky"
license=('GPL2')
depends=('bash' 'zenity' 'coreutils' 'sed' 'packer' 'pkgtools')
_gitroot="git://github.com/hunterm/blinky.git"
_gitname="blinky"

build() {
	cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d $_gitname ]] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
}

package() {
	cd ${srcdir}/${pkgname}

	# install the icon
	install -Dm644 ${pkgname}.png ${pkgdir}/usr/share/${pkgname}/${pkgname}.png

	# install the main executable
	install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}

	# install the .desktop file
	install -Dm644 Blinky.desktop ${pkgdir}/usr/share/applications/Blinky.desktop
}
