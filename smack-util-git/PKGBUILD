#pkgname=smack-util
#pkgver=0.1

pkgname=smack-util-git
pkgver=20120412
pkgrel=1
provides=('smack-util=0.1')
conflicts=('smack-util')
_gitroot='git://gitorious.org/meego-platform-security/smackutil.git'
_gitname='smack-util'

pkgdesc="Utilities for linux SMACK security model. Will soon be updatd with some basic configuration files in /etc/smack"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/promovicz/smack-util"
depends=('pam')
source=(
	etc-rc.d-smack
	smack.service
	smack.mount
	etc-smack-netlabel
	etc-smack-ambient
)
backup=(
	etc/smack/netlabel
	etc/smack/ambient
)
md5sums=('1d46412e5f3506e2d531c4886c6418fa'
         'd2d0df07f797c28c79c552acc1f294d3'
         '082eaefa9a2674d0cde4066b948ecafb'
         '505de7db895a01741c4f0b48e4ae1c3b'
         '92520a5a9cf893220b9cd447f585f144')

install=install

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

	# Compensate for this error - I rather change the -W flag then 
	# removing the 2 lines in the .c file since it's a git package...
	sed -i -e 's/-Werror/& -Wno-unused-but-set-variable/' src/Makefile
	make -C src
}

# TODO:
#check() {
#}

package() {
	cd "$srcdir/$_gitname-build"
	# This is for the old github repo
	# make PREFIX="$pkgdir" install
	make -C src ROOT="$pkgdir" install

	install -d -m755 "$pkgdir/etc/smack"
	install -d -m755 "$pkgdir/etc/smack/accesses.d"
	install -D -m644 "$srcdir/etc-smack-netlabel" "$pkgdir/etc/smack/netlabel"
	install -D -m644 "$srcdir/etc-smack-ambient" "$pkgdir/etc/smack/ambient"

	install -D -m755 "$srcdir/etc-rc.d-smack" "$pkgdir/etc/rc.d/smack"
	install -D -m644 "$srcdir/smack.service" "$pkgdir/usr/lib/systemd/system/smack.service"
	install -D -m644 "$srcdir/smack.mount" "$pkgdir/usr/lib/systemd/system/smack.mount"
}
