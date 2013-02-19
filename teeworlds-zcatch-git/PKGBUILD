# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Armin 'IsSuE' Praher [issue.at.gmx.dot.at]
# Contributor: [vEX] <niechift.dot.vex.at.gmail.dot.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Maintainer: Markus Unterwaditzer <markus@unterwaditzer.net>

pkgname=teeworlds-zcatch-git
pkgver=0.4.3
pkgrel=1
pkgdesc="A multiplayer 2D shooter -- zCatch version"
arch=('i686' 'x86_64')
url="http://teeworlds.com"
license=('custom')
depends=('alsa-lib' 'glu' 'sdl' 'freetype2')
makedepends=('python2' 'bam' 'mesa')
conflicts=('teeworlds')
replaces=('teewars')
_gitname='teeworlds'
_origname='teeworlds'
_gitroot='git://github.com/Teetime/teeworlds.git'

build() {
	# Build teeworlds

    cd "$srcdir"
    msg "Connecting to GIT server..."
    if [ -d "$_gitname" ] ; then
        cd "$_gitname" && git pull origin zCatch
        msg "The local files are updated."
    else
        git clone --depth=1 "$_gitroot" "$_gitname"
        cd "$_gitname"
        git branch zCatch
    fi
    msg "GIT checkout done or server timeout"

    echo "checkout zCatch"
    git checkout zCatch

	# Use Python 2
	sed -i 's/python /python2 /' bam.lua

	bam server_release client_release
}

package() {
	cd ${srcdir}/${_gitname}

	# Install data files
	mkdir -p ${pkgdir}/usr/share/${_origname}/data
	cp -r data/* ${pkgdir}/usr/share/${_origname}/data

	install -Dm755 ${_origname} ${pkgdir}/usr/bin/${_origname}
	install -Dm755 ${_origname}_srv ${pkgdir}/usr/bin/${_origname}_srv

	install -Dm644 license.txt \
		${pkgdir}/usr/share/licenses/${_origname}/license.txt
}
