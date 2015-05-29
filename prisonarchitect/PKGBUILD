# Maintainer: Duncan K. <duncank@fastmail.fm>

pkgname=prisonarchitect
pkgver=0_alpha33
pkgrel=1
pkgdesc='Prison construction and management simulation'
url='http://www.introversion.co.uk/prisonarchitect/'
arch=('i686' 'x86_64')
license=('custom:commercial')
depends=('libgl' 'glu')
conflicts=('prisonarchitect-hib')
options=('!strip' '!upx')
PKGEXT='.pkg.tar.gz'

# Download this file manually from
# http://www.introversion.co.uk/prisonarchitect/builds.html
_archive="prisonarchitect-alpha33-linux"

source=("${_archive}.tar.gz"
        "prisonarchitect.png::http://www.introversion.co.uk/prisonarchitect/images/tier/tier_icon250.png"
        "prisonarchitect.desktop")
sha256sums=('b0258ec78d373d7466c93cea468e60582396107c48aaf696ce4b3a773aae58d5'
            '1eacf1f2eb82fca67367aff8135bb8d2fe0be6339264aafbe1325e137dcdc924'
            '15bf56e490cef23c336c783cb6ef30b6a42ed7482e0cb44815a8c1b051efeea3')

build() {
  # Remove unneded architectures.
  find -name 'PrisonArchitect.*' -executable \! -name "PrisonArchitect.$CARCH" -delete
}

package() {
	cd $srcdir
	_installdir="/opt/prisonarchitect"; _target="${pkgdir}/${_installdir}"

	# Install game files
	mkdir -p $_target
	cp -rT $_archive $_target

	# Point launcher script to the correct directory
	sed -i "s|^base=.*|base=$_installdir|" "${_target}/PrisonArchitect"

	# Link executable
	install -d "${pkgdir}/usr/bin"
	ln -s "${_installdir}/PrisonArchitect" "${pkgdir}/usr/bin/prisonarchitect"

  # Install desktop file and icon
  install -Dm644 "${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
}
