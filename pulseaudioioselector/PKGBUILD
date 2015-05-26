# Maintainer: Evan Penner

pkgname=pulseaudioioselector
pkgver=1.2
pkgrel=1
pkgdesc="An application to select input/output device for PulseAudio"
arch=('i686' 'x86_64')
url="http://shellscripts.org/project/pulseaudioioselector"
license=('GPL')
depends=('libglade' 'pulseaudio' 'libnotify' 'gconf' 'libxtst' 'avahi')
source=(http://shellscripts.org/dl/projects/p/pulseaudioioselector/version_1/$pkgname.sh)
sha1sums=('04b6b23ec080940407ee291be087175090534d97')

package() {
	install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
}
