# Maintainer: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: SpepS <dreamspepser@yahoo.it>

pkgname=giada
pkgver=0.9.6
pkgrel=1
pkgdesc="A minimal, hardcore audio tool and loop machine for DJs and live performers"
arch=('i686' 'x86_64')
url=http://www.giadamusic.com/
license=(GPL3)
depends=('libxpm' 'fltk' 'libpulse' 'jack' 'rtmidi>=2.1.0')
install="$pkgname.install"

_giada="$pkgname-$pkgver-src"
source=("http://sourceforge.net/projects/giada-looper/files/giada-${pkgver}-src.tar.gz"
    'giada-logo.png'
    'giada.desktop'
    'steinberg-vst24.patch')

provides=('giada')
conflicts=('giada-git')
    
prepare() {
	cd $_giada
	## patch to use steinberg-vst24 from AUR
	## if you have it, add --enable-vst further down
	#patch -p1 -i "$srcdir/steinberg-vst24.patch"
    ##
	## Alternativly, leave out the patch, google for 'vst/aeffectx.h' 
	## and put aeffect.h, aeffectx.h, vstfxstore.h in src/vst/ ;)
	##
	## force use of system CFLAGS/CXXFLAGS
	#sed -i 's:CFLAGS   = @CXXFLAGS@:CFLAGS   += @CXXFLAGS@:' src/rtaudio/Makefile.in
}


build() {
    cd $_giada
    ./configure --prefix=/usr --target=linux #--enable-vst 
	(cd src; make libs)
	make
}

package() {
    cd $_giada
    make DESTDIR="$pkgdir" install

    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/$pkgname-logo.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

md5sums=('3f3944e26c6c51a937aa306e4fdf0760'
         'e712157099a1be39f2adcfc4630d961e'
         '135bef9e2df07b7550a2f4e4358b6933'
         'ad3b4feac7bb5ad8dbd831e9fd7c0ac7')


