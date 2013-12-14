# Maintainer: roobre <roobreland@gmail.com>

# Contributors by way of cgminer package in arch repos
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: monson <holymonson@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: David Manouchehri <david@davidmanouchehri.com>

# Contributor by way of cgminer-git in AUR
# Contributor: Atterratio <atterratio at gmail>

# Contributor oiriginal cgminer-git in AUR
# Contributor: deusstultus <deusstultus@gmail.com>

# Contributor: Thermionix <thermionix@gmail.com>

pkgname=cgminer-rpi-git
provides=('cgminer')
pkgver=5828.78a657a
pkgrel=1
pkgdesc="Multi-threaded multi-pool GPU, FPGA and ASIC miner for bitcoin and derivative coins. Optimized build for Raspberry Pi."
url='https://github.com/ckolivas/cgminer'
license=('GPL3')
arch=('armv6h')
depends=('curl' 'libusbx' 'jansson')
conflicts=('cgminer' 'cgminer-git-adl')
makedepends=('git')
optdepends=('ncurses: For ncurses formatted screen output')
source=("$pkgname"::'git+https://github.com/ckolivas/cgminer.git'
        'cgminer.service')
sha512sums=('SKIP'
            '3317b60c6b1f14c47d8ee636113ef40a4023ab14054129de80a37947b381fd2b647a7053f4e1bb639efa225a514e862fa531908714c34040dda2d6221dde7f5f')
_basename=cgminer
backup=("etc/${_basename}.conf")

pkgver() {
  cd "${srcdir}/${pkgname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
	cd "${srcdir}/${pkgname}"

	sed -e 's|^AC_CONFIG_SUBDIRS.*compat/jansson-2\.5.*||' \
	-e 's|JANSSON_LIBS="compat/jansson-2\.5/src/\.libs/libjansson\.a"|JANSSON_LIBS=-ljansson|' \
	-e 's|compat/Makefile||' \
	-i ./configure.ac

	sed -e 's|^JANSSON_CPPFLAGS= .*||' \
	-e 's|^USBUTILS_CPPFLAGS = .*|USBUTILS_CPPFLAGS = -I/usr/include/libusb-1.0|' \
	-e 's|^SUBDIRS.*|SUBDIRS = lib ccan|' \
	-i ./Makefile.am

	rm -r compat
}

build() {
	cd "${srcdir}/${pkgname}"

	CFLAGS="-O2 -Wall -march=native"

	./autogen.sh \
	--prefix=/usr \
	--enable-bflsc \
	--enable-bitforce \
	--enable-icarus \
	--enable-modminer \
	--enable-avalon \
	--enable-klondike \
	--enable-bitfury \
	--enable-hashfast \
	--enable-bab \
	--with-system-libusb

	make
}

package() {
	cd "${srcdir}/${pkgname}"

	make DESTDIR="${pkgdir}" install

	install -d "${pkgdir}/usr/share/${_basename}"
	install -m755 miner.php api-example.* "${pkgdir}/usr/share/${_basename}/"

	install -Dm644 "${srcdir}/cgminer.service" "${pkgdir}/usr/lib/systemd/system/${_basename}.service"

	sed 's#/usr/local/bin#/usr/bin#g' example.conf > ${_basename}.conf
	install -Dm644 ${_basename}.conf "${pkgdir}"/etc/${_basename}.conf
}
