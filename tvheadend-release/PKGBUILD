# Maintainer: StoneCold <forumi0721[at]gmail[dot]com>

pkgname=("tvheadend-release")
pkgver=4.1
pkgrel=1
pkgdesc="TV streaming server for Linux"
arch=("i686" "x86_64" "arm" "armv6h" "armv7h")
url="https://tvheadend.org/"
license=("GPL3")
depends=("avahi" "openssl" "python2" "uriparser" "ffmpeg")
makedepends=("git" "java-runtime")
optdepends=(
	"xmltv: For an alternative source of programme listings"
)
provides=("tvheadend")
conflicts=("tvheadend" "tvheadend-git" "hts-tvheadend" "hts-tvheadend-svn")
install=${pkgname}.install
source=(
	"https://github.com/tvheadend/tvheadend/archive/v4.1.tar.gz"
	"tvheadend.service"
)
md5sums=(
	"d73362985dffdadb5794d306147db58c"
	"b546f4486f0d28bea13ad1fb676acb27"
)

build() {
	cd "${srcdir}/${pkgname/-release/}-${pkgver}"
	CFLAGS+=" `pkg-config --cflags libavcodec libavutil libavformat libswscale`"
	LDFLAGS+=" `pkg-config --libs libavcodec libavutil libavformat libswscale`"
	./configure --prefix=/usr --mandir=/usr/share/man/man1 --python=python2 --release
	make
}

package() {
	cd "${srcdir}/${pkgname/-release/}-${pkgver}"
	make DESTDIR="${pkgdir}/" install
	install -Dm644 "${srcdir}/tvheadend.service" "${pkgdir}/usr/lib/systemd/system/tvheadend.service"
}
