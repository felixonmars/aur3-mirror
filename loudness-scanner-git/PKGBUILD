# Maintainer: Robert Mackanics <schnoopay@gmx.com>

pkgname=loudness-scanner-git
pkgver=r686.cc72596
pkgrel=1
pkgdesc="A tool that scans your music files according to the EBU R128 standards."
arch=('x86_64')
url="https://github.com/jiixyj/loudness-scanner"
license=('MIT')
depends=('')
makedepends=('git' 'cmake')
optdepends=('gtk2: scanner dependency'
            'qt4: scanner dependency'
	    'speex: speexdsp resampler'
            'taglib: scanner dependency'
            'libsndfile: SNDFILE input module support'
            'mpg123: MPG123 input module support'
            'ffmpeg: FFMPEG input module support'
            'gstreamer0.10: GStreamer  input module support')
provide=('libebur128')
conflicts=('libebur128'
           'libebur128-git')
source=("$pkgname"::'git+https://github.com/jiixyj/loudness-scanner.git'
	"ebur128-git"::'git+https://github.com/jiixyj/libebur128.git'
	"filewalk-git"::'git+https://github.com/jiixyj/filewalk.git')
md5sums=('SKIP'
         'SKIP'
         'SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags | printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare () {
	cd "$srcdir/$pkgname"
	git submodule init
	git config submodule."scanner/filetree".url "$srcdir/filewalk-git"
	git config submodule."ebur128".url "$srcdir/ebur128-git"
	git submodule update
}

build() {
	cd "$srcdir/$pkgname"
	mkdir build
	cd build
	cmake -DDISABLE_MPCDEC=ON -DCMAKE_INSTALL_PREFIX=/usr ..
	make VERBOSE=1
}

package() {
	cd "$srcdir/$pkgname/build"
	make DESTDIR="$pkgdir/" install
# I don't know why but make install doesn't install these...
	install -d "$pkgdir/usr/bin/"
	install -m755 "$srcdir/$pkgname/build/loudness" "$pkgdir/usr/bin/"

  for i in [ loudness-drop-gtk loudness-drop-qt ]; do
	if [ -e "$srcdir/$pkgname/build/$i" ]; then
	install -m755 "$srcdir/$pkgname/build/$i" "$pkgdir/usr/bin/"
	fi
  done

  for i in [ libinput_ffmpeg.so libinput_gstreamer.so libinput_mpcdec.so libinput_mpg123.so libinput_sndfile.so ]; do
	if [ -e "$srcdir/$pkgname/build/$i" ]; then
	install -m755 "$srcdir/$pkgname/build/$i" "$pkgdir/usr/lib/"
	fi
  done
# Copy License
	install -d -m755 "$pkgdir/usr/share/licenses/$pkgname/"
	install -m644 "$srcdir/$pkgname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/"
}
