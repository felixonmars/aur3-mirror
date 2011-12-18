pkgname=obmixer
pkgver=0.11
pkgrel=5
pkgdesc="OBmixer is a GTK mixer applet that runs in the system trey of the window manager or panel, \
lightweight, works with both pulseaudio and alsa, has mute/umute feature which remembers\
your previous volume, works with tint2, can run outside of gnome."
arch=('i686' 'x86_64')
license=('GPL')
url="http://jpegserv.com/"
groups=('obmixer')
depends=('gtk2' 'alsa-lib')
optdepends=('gnome-alsamixer: gui for configuring alsa options'
	    'pavucontrol: for configuring pulseaudio')

source=(http://jpegserv.com/linux/obmixer/obmixer-${pkgver}.tar.bz2
obmixer_alasamixergui.patch)
build() {

cd "${srcdir}/${pkgname}-${pkgver}"


patch -p0 < ${srcdir}/obmixer_alasamixergui.patch

./autogen.sh || return 1
./configure --prefix=/usr LIBS="-lm" || return 1
make || return 1
make DESTDIR="$pkgdir" install || return 1
}

md5sums=('32cf7841c7a0aee6c1238340d729d9d6'
         'd18a515aaa543214d11052d8a07434f7')
