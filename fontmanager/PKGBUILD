#Maintainer: Steven Allen < steven {a} stebalien {o} com >
#Contributor: Sebastian Wolf < sebastian at melonkru dot de >
pkgname=fontmanager
pkgver=0.5
pkgrel=4
pkgdesc='A tool written in python for previewing and (de-)activating font families'
arch=('i686' 'x86_64')
url='http://fontmanager.blogspot.com'
license='GPL3'
depends=('pygtk' 'fontconfig')
#source=('http://home.comcast.net/~kambo187/fontmanager.py')
#md5sums=('877c6cf91f76abbd4160b78b9a7a3496')
source=('fontmanager.py' 'fontmanager.desktop')
md5sums=('91f108d2d2b094711c2823fc95e91675'
         '5509824103099c9e5730b5de7efa475c')


package() {
	# Install script
	install -Dm755 ${srcdir}/$pkgname.py ${pkgdir}/usr/bin/$pkgname

	# Install .desktop file
	install -Dm644 ${srcdir}/fontmanager.desktop ${pkgdir}/usr/share/applications/fontmanager.desktop
}
