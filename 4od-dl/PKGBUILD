pkgname=4od-dl
pkgver=20130210
pkgrel=1
pkgdesc="Ruby script to download, convert and tag stuff from 4od."
arch=(any)
url="https://github.com/robwatkins/4od-dl"
license=('unknown')
depends=(ruby ruby-hpricot ruby-logger ruby-crypt rtmpdump ffmpeg atomicparsley)
makedepends=(git)

_gitroot='https://github.com/robwatkins/4od-dl.git'
_gitname='4od-dl'

prepare() {
	[ -e "$srcdir/4od-dl" ] && rm -rf "$srcdir/4od-dl"
	cd "$srcdir"
	msg "Connecting to GIT server...."
	git clone "$_gitroot" "$_gitname"
	msg "GIT checkout done or server timeout"
}

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "$pkgdir/usr/bin/"
	(echo "#!/usr/bin/ruby" ; cat 4od-dl.rb) > "$pkgdir/usr/bin/4od-dl"
	chmod 755 "$pkgdir/usr/bin/4od-dl"
}
