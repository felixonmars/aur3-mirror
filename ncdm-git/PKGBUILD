# Maintainer: Sapphira Armageddos <shadowkyogre@aim.com>
pkgname=ncdm-git
pkgver=20120615
pkgrel=6
arch=('any')
license=('GPL')
url="https://github.com/ShadowKyogre/NCDM"
pkgdesc="An NCurses display manager"
source=()
depends=('python-urwid' 'xorg-sessreg' 'xorg-xinit' 'coreutils' 'kbd' 'grep')
optdepends=('consolekit: for consolekit stuff'
	'python-dbus: for consolekit stuff'
	'fbterm: for background images in CLI sessions'
	'fbv: for background images in CLI sessions')
conflicts=('ncdm')
provides=('ncdm')
backup=('etc/ncdm/sys.cfg')
install=ncdm.install
_gitroot=git://github.com/ShadowKyogre/NCDM.git

build() {
  cd "${srcdir}"
  if test -d NCDM;then
    cd NCDM
    git pull
  else
    git clone ${_gitroot} --depth=1
  fi
}

package() {
	cd "${srcdir}/NCDM"
	mkdir -vp ${pkgdir}/usr/{share/ncdm{,/themes},bin}
	mkdir -vp ${pkgdir}/etc/ncdm
	cp -v fbterm-bi ncdm  ${pkgdir}/usr/bin
	cp -v *.py  ${pkgdir}/usr/share/ncdm
	cp -v sys.cfg  ${pkgdir}/etc/ncdm
	cp -v default.json  ${pkgdir}/usr/share/ncdm/themes
}
