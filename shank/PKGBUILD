# Maintainer: N30N <archlinux@alunamation.com>
# Contributor: swiftgeek <swiftgeek@gmail.com>
# Contributor: Marvn <mistrmarvn@gmail.com>
# Contributor: C5OK5Y <claudiokozicky@gmail.com>

pkgname="shank"
pkgver=120720110
pkgrel=4
pkgdesc="A 2D side-scrolling beat 'em up."
url="http://www.shankgame.com/"
license=("custom")
arch=("i686" "x86_64")
groups=("humble-indie-bundle4")
if [ "${CARCH}" == "x86_64" ];
	then depends=("lib32-sdl" "lib32-libgl")
	else depends=("sdl" "libgl")
fi
source=("hib://${pkgname}-linux-${pkgver}-1-bin" "shank.sh" "shank.desktop")
md5sums=("f42fb76ad67316c3d7fa5378ad9c5f57" \
	"dd6523a1d46bab31a07178da66357e9d" \
	"159eddeeba8a32d5c8932c8d802ad1af")
PKGEXT=".pkg.tar"
DLAGENTS+=("hib::/usr/bin/hib-dlagent -o %o %u || error 'Unconfigured hib DLAGENT?' && exit 1")

msg "Optional make dependencies for ${pkgname}"
msg2 "hib-dlagent: download agent for humble-bundle source file(s) $(pacman -Qs hib-dlagent >/dev/null && echo "[installed]")"

package() {
	install -Dm755 shank.sh "${pkgdir}/usr/bin/shank"
	install -Dm644 shank.desktop "${pkgdir}/usr/share/applications/shank.desktop"

	cd data
	install -Dm644 bin/.DS_Store "${pkgdir}/opt/shank/bin/.DS_Store"
	install -m755 bin/{libfmodevent-4.30.02.so,libfmodex-4.30.02.so,Shank} \
		"${pkgdir}/opt/shank/bin"
	find {data,data-pc,reslists} -type f \
		-exec install -Dm644 "{}" "${pkgdir}/opt/shank/{}" \;
}

# vim: set noet ff=unix:
