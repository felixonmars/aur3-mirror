# Maintainer: dreieck <felix )dot( becker (at( zih )dot) tu-dresden |dot| de>.
# Contributor: grufo <grossomalpelo at gmail dot com>
# Contributor: sjakub

pkgname="alsa-driver"
pkgver="1.0.25"
pkgrel="8"
pkgdesc="ALSA modules from alsa-project.org. May be more up-to-date than in-kernel drivers."
arch=('i686' 'x86_64')
url='http://www.alsa-project.org/'
license=('GPL' 'LGPL')
makedepends=('linux-headers')

_mirrors=(
"http://alsa.mirror.fr/driver/${pkgname}-${pkgver}.tar.bz2"
"http://dl.ambiweb.de/mirrors/ftp.alsa-project.org/driver/${pkgname}-${pkgver}.tar.bz2"
"http://gd.tuwien.ac.at/opsys/linux/alsa/driver/${pkgname}-${pkgver}.tar.bz2"
"http://alsa.cybermirror.org/driver/${pkgname}-${pkgver}.tar.bz2"
"ftp://gd.tuwien.ac.at/opsys/linux/alsa/driver/${pkgname}-${pkgver}.tar.bz2"
"ftp://ftp.task.gda.pl/pub/linux/misc/alsa/driver/${pkgname}-${pkgver}.tar.bz2"
"ftp://mirrors.zerg.biz/alsa/driver/${pkgname}-${pkgver}.tar.bz2"
"ftp://ftp.alsa-project.org/pub/driver/${pkgname}-${pkgver}.tar.bz2"
)
_findMirror() {
	for mirr in ${_mirrors[@]}; do
		if wget --spider -q $mirr; then
			echo -n "$mirr"
			return 0
		fi
	done
	return 1
}

source=("$(_findMirror)" "alsa-driver.install")
# source=("ftp://ftp.alsa-project.org/pub/driver/alsa-driver-${pkgver}.tar.bz2" "alsa-driver.install")
install="alsa-driver.install"

md5sums=('ac56465c262ced60b5eb2d6492d7a923' '0d12d2b368b6169fd34c1e0418281df3')
sha512sums=('51164c5f1c6e40e188be8e544ddc610b56ffb7d696bc925a0a30e6819d6cbd90a7f9f33c379d411d0e7a172a3ed1cf15b59c27654d63db1a9bad2051331d3017' 'b415d924e40e79d86a7d0f97e50c8f9757c9ac5ccea867c9ec7ca2fd543104edf8cc2c5e76c592493f169d894d71cbb80681ef0ed5d6c1624b7b957ba38474e2')



_extractdir="${srcdir}/alsa-driver-${pkgver}"

build()
{
  cd "${_extractdir}" || exit 11
  
  ./configure --with-oss=yes --with-sequencer=yes --with-isapnp=auto --with-pcm-oss-plugins=yes --with-cards=all --with-card-options=all --with-moddir=updates || exit 21
  
  make || exit "$?"
}

package()
{
  cd "${_extractdir}" || exit 101
  make DESTDIR="${pkgdir}" install-modules || exit "$?"
  find "${pkgdir}" -name '*.ko' -exec gzip -9 {} \;
}

