# Maintainer: izmntuk
pkgname=pixiv-agent-git
pkgrel=1
pkgver=12.eb7209b
pkgdesc='User-friendly pyqt4-based download agent for Pixiv'
license=('unknown')
url='http://bangumi.tv/group/topic/45412'
depends=('python2-requests' 'python2-numpy' 'python2-lxml' 'python2-pillow' 'python2-images2gif' 'python2-pyqt4')
arch=('any')
makedepends=('git')
conflicts=("${pkgname%-*}")
source=('git+https://github.com/GeQi/PixivAgent' 'pixiv-agent.desktop')
_reponame='PixivAgent'
sha1sums=('SKIP' 'SKIP')

pkgver() {
	cd "${srcdir}/${_reponame}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_reponame}"
	python2 -O -m compileall *.py
	python2 -m compileall *.py
}

package() {
	cd "${srcdir}/${_reponame}"
	install -dm755 "${pkgdir}"/usr/{lib/"${pkgname%-*}",bin,share/{icon,application}s}
	install -m644 PixivAgent.py{,c,o} PixivAgent.ui ui_PixivAgent.py{,c,o} "${pkgdir}/usr/lib/${pkgname%-*}"
	ln -srf "${pkgdir}/usr/lib/${pkgname%-*}/PixivAgent.py" "${pkgdir}/usr/bin/PixivAgent"
	install -m644 icon.png "${pkgdir}/usr/share/icons/pixiv.png"
	install -m644 "${srcdir}/"pixiv-agent.desktop "${pkgdir}/usr/share/applications"
}
