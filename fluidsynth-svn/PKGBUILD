# $Id: PKGBUILD 102552 2010-12-08 07:09:52Z schiv $
# Contributor:  Ray Rashif <schiv@archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Bernardo Barros <bernardobarros@gmail.com>

pkgname=fluidsynth-svn
pkgver=416
pkgrel=1
pkgdesc="A real-time software synthesizer based on the SoundFont 2 specifications"
arch=(i686 x86_64)
url="http://www.fluidsynth.org/"
depends=('glib2' 'jack' 'dbus-core' 'libpulse')
makedepends=('cmake' 'ladspa' 'doxygen')
optdepends=('bash: init script')
license=('LGPL')
provides=('fluidsynth')
conflicts=('fluidsynth')
backup=('etc/conf.d/fluidsynth')
source=(fluidsynth.conf
        fluidsynthd)

_svntrunk=https://fluidsynth.svn.sourceforge.net/svnroot/fluidsynth/trunk/fluidsynth
_svnmod=fluidsynth

build() {
	cd "$srcdir"
	
	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
  else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
		fi
			
	msg "SVN checkout done or server timeout"
	msg "Starting make..."
			
	rm -rf "$srcdir/$_svnmod-build"
	cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
	cd "$srcdir/$_svnmod-build"
			
  cmake . -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_BUILD_TYPE=Release \
          -Denable-ladspa=ON \
          -DLIB_SUFFIX=""
  make
}

package() {
	cd "$srcdir/$_svnmod-build"
	
  make DESTDIR="$pkgdir/" install

  install -Dm644 "$srcdir/fluidsynth.conf" \
    "$pkgdir/etc/conf.d/fluidsynth"

  install -Dm755 "$srcdir/fluidsynthd" \
    "$pkgdir/etc/rc.d/fluidsynth"
}

md5sums=('16c5f4d4cbdddc6c5fcbd4fd4cc142f1'
         'b296dbfb524c2164f552f68bd9abe2ec')
