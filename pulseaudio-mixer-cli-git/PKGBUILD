# Maintainer: Marko Rakamaric <marko.rakamaric@gmail.com> 
# Contributor: Ben R <thebenj88 *AT* gmail *DOT* com>

_pkgname=pulseaudio-mixer-cli
pkgname=pulseaudio-mixer-cli-git
pkgver=2015.01.27
pkgrel=1
pkgdesc="An interactive ncurses UI to control volume of pulse streams"
arch=('any')
url="https://github.com/mk-fg/pulseaudio-mixer-cli"
license=('custom:unknown')
makedepends=('git')
depends=('python2' 'python2-dbus' 'python2-gobject')
install=pulseaudio-mixer-cli.install
source=('git://github.com/mk-fg/pulseaudio-mixer-cli.git' 'pulseaudio-mixer-cli.install')
md5sums=('SKIP'
         'dc720d02772dedbf44cde19d6c87f3dd')

pkgver() {

	cd "$_pkgname"
  git log -1 --format=format:%cd --date=short | sed 's|-|.|g'
}

build() {

  # Use python2
  sed -i 's|/usr/bin/python|/usr/bin/python2|g' "${srcdir}/${_pkgname}/${_pkgname}.py"
}

package() {
	# NOTE: there is also rewrite of script called pa-mixer-mk2 which isn't included yet
	install -Dm755 "${srcdir}/${_pkgname}/${_pkgname}.py" "${pkgdir}/usr/bin/${_pkgname}"
}
