_pkgname=pattern-device
_pkgver=0.1
pkgname=pattern-device-git
pkgver=20120415
pkgrel=2
provides=("$_pkgname-$_pkgver")
conflicts=("$_pkgname")
_gitroot='git://github.com/Blub/patterndevice.git'
_gitname='patterndevice'

pkgdesc="binyes and /dev/pattern"
arch=('i686' 'x86_64')
license=('WTFPL')
url="https://github.com/Blub/patterndevice"
depends=('fuse')
source=(
	etc-rc.d-patterndev
	etc-conf.d-patterndev
	patterndev.service
	)
backup=(etc/conf.d/patterndev)
md5sums=('3c15b4a6a516dcbae13436f8f295e4e4'
         '3db88a411b5b544c009d0bd3f2a08100'
         '24935973e5d0e1c42c961f4bcd195b49')

build() {
	cd "$srcdir"
	msg "Connecting to GIT server..."

	if [[ -d "$_gitname" ]]; then
		cd "$_gitname" && git pull origin
		msg "The local files are updated."
	else
		git clone "$_gitroot" "$_gitname"
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting build..."

	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

	make
}

check() {
	cd "$srcdir/$_gitname-build"
	make check
}

package() {
	cd "$srcdir/$_gitname-build"
	make DESTDIR="$pkgdir" install

	cd "$srcdir"
	install -d -m755                       "$pkgdir/etc/rc.d"
	install    -m755 etc-rc.d-patterndev   "$pkgdir/etc/rc.d/patterndev"
	install -d -m755                       "$pkgdir/etc/conf.d"
	install    -m644 etc-conf.d-patterndev "$pkgdir/etc/conf.d/patterndev"
	install -d -m755                       "$pkgdir/usr/lib/systemd/system"
	install    -m644 patterndev.service    "$pkgdir/usr/lib/systemd/system/"
}
