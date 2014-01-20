# Maintainer: Kim Silkebækken <kim.silkebaekken+aur@gmail.com>

_gitname=powerline-fontpatcher
_gitbranch=develop
pkgname="python2-${_gitname}-git"
pkgdesc='OTF/TTF font patcher for Powerline symbols'
pkgver=5.18a788b
pkgrel=1
url="https://github.com/Lokaltog/${_gitname}"
license=('MIT')
arch=('any')
depends=('python2' 'fontforge')
makedepends=('git' 'python2-setuptools')
source=("${_gitname}::git://github.com/Lokaltog/${_gitname}.git#branch=${_gitbranch}"
        "powerline-fontpatcher.patch")
sha256sums=('SKIP'
            'fe01056e192c6b1c6d42ecca51133133a9a0318cf305bb7bb3bee5d2a9cf851d')

pkgver() {
	cd "${_gitname}"
	echo "$(git rev-list --count ${_gitbranch}).$(git rev-parse --short ${_gitbranch})"
}

prepare() {
	cd "${srcdir}/${_gitname}"
	patch -p1 < ../powerline-fontpatcher.patch
}

package() {
	cd "${_gitname}"

	# Font patcher
	install -Dm755 "scripts/powerline-fontpatcher" "${pkgdir}/usr/bin/powerline-fontpatcher"
	install -Dm644 "fonts/powerline-symbols.sfd" "${pkgdir}/usr/share/${_gitname}/powerline-symbols.sfd"
}
