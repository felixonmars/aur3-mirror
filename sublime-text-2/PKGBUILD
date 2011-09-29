# Maintainer: Bartosz Chmura <chmurli at gmail dot com>

pkgname=sublime-text-2
pkgver=2126
_build=2126
pkgrel=1
pkgdesc="sophisticated text editor for code, html and prose"
arch=('i686' 'x86_64')
url="http://www.sublimetext.com/2"
license=('custom')
depends=(libpng12 gtk2 desktop-file-utils)
install=$pkgname.install
_arch=' x64'
_archurl='%20x64'
[[ "${CARCH}" = i686 ]] && _arch='' && _archurl=''
source=(
    "Sublime Text 2 Build ${_build}${_arch}.tar.bz2::http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202%20Build%20${_build}${_archurl}.tar.bz2"
    'sublime-text-2.desktop'
	'sublime-text-2-icon.png'
)

md5sums=(
    'b04d80469d8cc60912ffde39952ce317'
    '62f87ce1c5348d55a2957799d334115c'
	'd08225e4b82a9de9a8fcbbf2b4aa6c23'
)
[[ "${CARCH}" = i686 ]] && md5sums[0]='e2b0895f6330c9b12cefdffe660170b0'



package() {

	mkdir -p ${pkgdir}/opt/${pkgname}
	
	# remove 
	cd ${srcdir}
	#yes | rm -Rf "Sublime Text 2" || return 1

	tar xvjf "Sublime Text 2 Build ${_build}${_arch}.tar.bz2" || return 1
	cp -R Sublime\ Text\ 2/* ${pkgdir}/opt/${pkgname} || return 1
	chmod -R 755 ${pkgdir}/opt/${pkgname} || return 1

	# icon
	install -m 644 ${srcdir}/sublime-text-2-icon.png ${pkgdir}/opt/${pkgname} || return 1

	install -d -m 755 ${pkgdir}/usr/share/applications || return 1
	install -m 644 ${srcdir}/sublime-text-2.desktop ${pkgdir}/usr/share/applications || return 1



}




