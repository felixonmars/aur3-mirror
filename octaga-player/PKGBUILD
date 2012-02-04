# Contributor: Nuno Aniceto "quarkup" <nuno.aja@gmail.com>
# Maintainer: Nuno Aniceto "quarkup" <nuno.aja@gmail.com>

pkgname='octaga-player'
_name='octagaplayer'
pkgver='2.3.0'
_ver="${pkgver}.3rc1"
pkgrel='1'
pkgdesc="The World's best 3D player for VRML and X3D"
arch=('i686' 'x86_64' 'any')
url='http://www.octaga.com'
depends=('openal' 'gtk2')
[[ "${CARCH}" = "i686" ]] && depends=("${depends[@]}" 'libjpeg6' 'libpng12')
[[ "${CARCH}" = "x86_64" ]] && depends=("${depends[@]}" 'lib32-libjpeg6' 'lib32-libpng12')
license=('custom')
install="${pkgname}.install"
source=("http://www.octaga.com/freedownloads/OctagaPlayer/linux/${_ver}/${_name}.${_ver}.tar.gz"
	"http://www.octaga.com/freedownloads/OctagaPlayer/current/license.pdf")
md5sums=('70c3fc43aff220ad0f4fee62e9b68a93' 'fb429a4954bec9d91ff13cfcdd4ae4fa')


build() {
	cd "${srcdir}/${_name}.${_ver}";
	
	mv "usr/" "${pkgdir}/";

	msg2 "Updating mozilla/firefox plugins...";

	[[ -d "/usr/lib/mozilla/plugins/" ]] && ln -sf '/usr/lib/mozilla/plugins/npOctaga.so' "${pkgdir}/usr/lib/octagaplayer/npOctaga.so";
	[[ -d "/usr/lib/firefox/plugins/" ]] && ln -sf '/usr/lib/firefox/plugins/npOctaga.so' "${pkgdir}/usr/lib/octagaplayer/npOctaga.so";

	install -Dm644 "${srcdir}/license.pdf" \
                       "${pkgdir}/usr/share/licenses/${pkgname}/license.pdf";
}

