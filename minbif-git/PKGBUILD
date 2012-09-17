# Maintainer: AkiraYB <brunoyb!outlook,com>

pkgname=minbif-git
_pkgname=minbif
pkgver=20120707
pkgrel=1
pkgdesc='An IRC to IM gateway (like BitlBee) that uses libpurple (from Pidgin)'
arch=('i686' 'x86_64')
url='http://minbif.im/'
license=('GPL2')
depends=('gnutls' 'libcaca' 'libpurple')
makedepends=('cmake' 'git')
optdepends=('xinetd: to run minbif through xinetd')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=('etc/minbif/minbif.conf'
        'etc/minbif/minbif.motd'
        'etc/xinetd.d/minbif')
install="${_pkgname}.install"
changelog="${_pkgname}.changelog"
source=("${_pkgname}.rcd"
        "${_pkgname}.xinetd"
        "${_pkgname}.tmpfiles")
sha256sums=('cc841891b7013dec206b76bb3e7a70d90fa2b8e26b942b378d1918895fd95f1e'
            '77d49f2685c090c1518e3ea871a1637add445c677cb3c21b92686d23f5e4f5d6'
            'cef27c7e775c669cd0e9286a575623bd17a3afbbfc4f69cade6126b6eb9aa209')

_gitroot='git://git.symlink.me/pub/romain/minbif.git'
_gitname=minbif

build()
{
	cd "$srcdir"

	msg 'Connecting to Git server...'

	if [ -d "$_gitname" ]
	then
		cd "$_gitname" && git pull origin
		msg 'The local files are updated.'
	else
		git clone "$_gitroot" "$_gitname"
	fi

	msg 'Git checkout done or server timeout.'
	msg 'Starting make...'

	rm -rf "${srcdir}/${_gitname}-build"
	git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
	cd "${srcdir}/${_gitname}-build"

	sed -e 's/farsight2-0.10/farstream-0.1/' \
	    -e 's/farsight/farstream/' \
	    -e 's/FARSIGHT/FARSTREAM/' -i CMakeLists.txt

	sed -e 's/FARSIGHT/FARSTREAM/' -i src/CMakeLists.txt

	# compile with default options + ENABLE_VIDEO=ON
	make PREFIX=/usr \
	     CONF_PREFIX=/etc/minbif \
	     ENABLE_MINBIF=ON \
	     ENABLE_IMLIB=ON \
	     ENABLE_CACA=ON \
	     ENABLE_VIDEO=ON \
	     ENABLE_PLUGIN=OFF \
	     ENABLE_PAM=ON \
	     ENABLE_TLS=ON \
	     DEBUG=OFF
}

package()
{
	cd "${srcdir}/${_gitname}-build"

	install -dm 770 -o 67 -g 67 "${pkgdir}/var/lib/minbif"
	install -dm 770 -o 67 -g 67 "${pkgdir}/var/lib/minbif/users"

	install -Dm 755 "${srcdir}/${_pkgname}.rcd" \
	                "${pkgdir}/etc/rc.d/minbif"
	install -Dm 644 "${srcdir}/${_pkgname}.xinetd" \
	                "${pkgdir}/etc/xinetd.d/minbif"
	install -Dm 644 "${srcdir}/${_pkgname}.tmpfiles" \
	                "${pkgdir}/usr/lib/tmpfiles.d/minbif.conf"

	make DESTDIR="$pkgdir" install
}
