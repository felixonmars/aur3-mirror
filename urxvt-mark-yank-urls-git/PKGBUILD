# Maintainer: Army <uli dot armbruster [google]>
# Contributor: StephenB <mail4stb at gmail dot com>

pkgname=urxvt-mark-yank-urls-git
pkgver=20100720
pkgrel=1
pkgdesc="mouseless url yanking for rxvt-unicode (urxvt)"
arch=("any")
depends=('rxvt-unicode' 'xclip' 'perl-clipboard')
makedepends=('git')
provides=('urxvt-mark-yank-urls')
conflicts=('urxvt-mark-yank-urls')
replaces=('rxvt-url-yank')
install=${pkgname}.install
license=("GPL")
url='http://www.jukie.net/bart/blog/urxvt-url-yank'
source=()
md5sums=()

_gitroot=git://git.jukie.net
_gitname=urxvt

build() {
	cd ${srcdir}
	if [ -d ${_gitname} ] ; then
		cd ${_gitname} && git pull origin
		msg "The local files are updated."
	else
		git clone ${_gitroot}/${_gitname}
	fi
	install -Dm755 ${srcdir}/${_gitname}/mark-yank-urls ${pkgdir}/usr/lib/urxvt/perl/mark-yank-urls
}
