# Maintainer: Doug Richardson <dougie.richardson@gmail.com>
# Contributor: feilen <feilen1000@gmail.com>
# Contributor: Thermionix <thermionix@gmail.com>

pkgname=octoprint-git
pkgver=1.1.1.r18.g868dc6d
pkgrel=1
pkgdesc="OctoPrint provides a responsive web interface for controlling a 3D printer (RepRap, Ultimaker, ...)"
arch=('i686' 'x86_64' 'armv6' 'armv6h')
url="https://github.com/foosel/OctoPrint"
license=('GPL')
depends=( 'python2-flask' 'python2-numpy' 'python2-pyserial' 'python2-tornado' 'python2-tornadio2' 'python2-yaml' 'python2-flask-login' 'python2-flask-principal' 'python2-netaddr' 'python2-blinker' 'python2-sockjs-tornado-git' )
makedepends=( 'git' )
optdepends=( 
	'ffmpeg: timelapse support'
	'mjpg-streamer: stream images from webcam'
	'v4l-mjpg-stream: stream images from a Video4Linux capable camera'
)
provides=( 'octoprint' )
conflicts=( 'octoprint' )
install="octoprint.install"
source=( "$pkgname"::'git+https://github.com/foosel/OctoPrint.git'
	octoprint.run
	octoprint.service)
md5sums=('SKIP'
         '3bee9901c9eabed94b7f9236f83bf053'
         'ec5e51f876bb5fb223801bf28850908a')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}
package() {
	cd ${srcdir}/${pkgname}

	mkdir -p ${pkgdir}/usr/share/octoprint/

	cp -a ${srcdir}/${pkgname}/* ${pkgdir}/usr/share/octoprint/

	install -D -m755 ${srcdir}/octoprint.run ${pkgdir}/usr/bin/octoprint
	install -D -m644 ${srcdir}/octoprint.service ${pkgdir}/usr/lib/systemd/system/octoprint.service
}
