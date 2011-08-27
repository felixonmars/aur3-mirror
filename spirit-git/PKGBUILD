# Contributor: Matthew Bauer <mjbauer95@gmail.com>
_pkgname=spirit
pkgname=$_pkgname-git
pkgver=20100618
pkgrel=1
pkgdesc='Linux port of the "Spirit" jailbreak using libimobiledevice. Works on most iDevices (iPod Touch, iPhone, iPad). To jailbreak your device run "spirit"'
arch=('i686' 'x86_64')
url="http://spiritjb.com/"
license=('GPL')
groups=()
depends=('libimobiledevice')
makedepends=('git' 'gcc' 'make')
provides=("$pkgname")
conflicts=("$pkgname")
replaces=("$pkgname")
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot="git://github.com/posixninja/spirit-linux.git"
_gitname="$_pkgname-linux"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

	make || return 1

	mkdir -p "$pkgdir/usr/share/$_pkgname"
	cp -r igor resources "$pkgdir/usr/share/$_pkgname"
	cp "$_pkgname" "$pkgdir/usr/share/$_pkgname"

	mkdir -p "$pkgdir/usr/bin"
	echo -e '#!/bin/sh\ncd /usr/share/'$_pkgname'\n./'$_pkgname | tee "$pkgdir/usr/bin/$_pkgname" > /dev/null
	chmod +x "$pkgdir/usr/bin/$_pkgname"
} 
