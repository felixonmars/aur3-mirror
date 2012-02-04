# Maintainer :  Manuel Gaul <inkaine@hotmail.com>
# derived from kaffeine PKGBUILD by Damir Perisa <damir.parisa@bluewin.ch>
# and KDEmod kdemultimedia SPLITBUILD 3.5.10-1 by Jan Mette <funkyou@kdemod.ath.cx>

pkgname=kaudiocreator3
_basepkgname=kdemultimedia
pkgver=3.5.10
pkgrel=2
pkgdesc="KDE3 CD ripper and audio encoder frontend"
license=('GPL')
arch=('i686' 'x86_64')
url="http://www.kde.org/"
depends=('qt3' 'kdelibs3>=3.5.10' 'cdparanoia' 'xorg-iceauth')
makedepends=('pkgconfig' 'perl' 'lame' 'vorbis-tools' 'flac>=1.1.4' 'taglib')
optdepends=('lame' 'vorbis-tools' 'flac>=1.1.4')
conflicts=('kdemultimedia<=4.0')
provides=('kaudiocreator' 'libkcddb3' 'kdemultimedia3-kioslave')
source=("http://download.kde.org/stable/${pkgver}/src/${_basepkgname}-${pkgver}.tar.bz2" "http://chakra-project.org/svn/branches/kde3/kdemultimedia/02_kioslave-flac.patch")
md5sums=('8e8cd7f41d37f7da8bd239048abf3516' '72791ea8b5767cec50d02375322a2315')

build() {
	cd ${startdir}/src/${_basepkgname}-${pkgver}

	# Apply KDEmod kioslave flac patch
	patch -p1 -i ../02_kioslave-flac.patch

	. /etc/profile.d/qt3.sh
	. /etc/profile.d/kde3.sh

	./configure --prefix=/opt/kde \
		--without-arts \
		--with-alsa \
		--with-lame \
		--with-vorbis \
		--disable-dependency-tracking \
		--disable-debug \
		--with-speex \
		--enable-gcc-hidden-visibility \
		--enable-final \
		--enable-new-ldflags LDFLAGS="${LDFLAGS} -L/opt/qt/lib -L/opt/kde/lib -L/opt/kde/lib/kde3"
	cd libkcddb
	make || return 1
	make DESTDIR=${pkgdir} install
	cd ../kscd
	make || return 1
	cd ../kaudiocreator
	make || return 1
	make DESTDIR=${pkgdir} install
	cd ../kioslave
	make || return 1
	make DESTDIR=${pkgdir} install
}
