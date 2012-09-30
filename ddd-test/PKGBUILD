# Maintainer: INVENT <invent@0x0a.net>

pkgname=ddd-test
pkgver=20120930
pkgrel=1
pkgdesc="sdfdsf"
arch=(any)
license=('GPL')
url="https://github.com/Infinality/fontconfig-infinality"
depends=('fontconfig' 'freetype2-infinality')
install='install.sh'
provides=('fontconfig-infinality')
conflicts=('fontconfig-infinality')
backup=(
	'etc/fonts/infinality/infinality.conf'
	'etc/fonts/conf.d/52-infinality.conf'
)

_gitroot="https://github.com/Infinality/fontconfig-infinality.git"
_gitname="fontconfig-infinality"

package() {
    cd "$srcdir"
    msg "Connecting to GIT server...."
    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        msg "First time connected - cloning repo, this may take a while..."
        git clone $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"

	_destdir="$pkgdir"/etc/fonts

	mkdir -p $_destdir/{conf.avail,conf.d,infinality} "$pkgdir"/usr/bin
	cp -r "$srcdir"/"$_gitname"/{conf.avail,conf.d,infinality} $_destdir
	ln -sf /etc/fonts/infinality/infctl.sh "$pkgdir"/usr/bin/infctl
}
