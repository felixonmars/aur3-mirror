# Maintainer: Wellington 
# Email: wellington79@gmail.com
pkgname=screenlets-impulse
pkgver=0.5
pkgrel=5
pkgdesc="Screenlets VU for pulse."
arch=('i686' 'x86_64')
url="http://gnome-look.org/content/show.php/Impulse+-+PulseAudio+visualizer?content=99383"
license=('GPL')
depends=('screenlets' 'pulseaudio' 'fftw')

_filename=Impulse-0.5.5-screenlet-x86.tar.gz
source=(http://launchpad.net/impulse.bzr/main/impulse-0.5/+download/$_filename)
md5sums=('8477bbe570f584c70f20c305f936e984')

if [ "${CARCH}" = 'x86_64' ]; then
	_filename=Impulse-0.5.5-screenlet-x86_64.tar.gz
	source=(http://launchpad.net/impulse.bzr/main/impulse-0.5/+download/$_filename)
	md5sums=('907f529e6d801a036ac436e57d2b128c')
fi

build() {
  cd "$srcdir/"
  mkdir -p $pkgdir/usr/share/screenlets/
  
  rm -rf $srcdir/$_filename
  cp -R $srcdir/* $pkgdir/usr/share/screenlets/
}
