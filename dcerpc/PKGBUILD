# Maintainer: SJ_UnderWater

pkgname=dcerpc
pkgver=1.2.2
pkgrel=1
pkgdesc='Implementation of RPC developed as part of the Distributed Computing Environment'
arch=('i686' 'x86_64')
url='http://www.dcerpc.org/'
license=('BSD')
depends=('krb5')
makedepends=('git')
options=('!libtool')
install=$pkgname.install
source=(dcerpcd.rc)
md5sums=('74c9e3e5ed29c174dc6b51105966ab0b')
_gitroot=git://git.dcerpc.org/dcerpc.git
_gitname=dcerpc.git

build() {
	msg2 "Connecting to server...."
	if [ ! -d "$_gitname" ]; then
		git clone "$_gitroot" "$_gitname"
		cd $_gitname/$pkgname
		msg2 "Bootstrapping..."
		./buildconf >/dev/null
		msg2 "Configuring..."
		./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
		msg2 "Fixing..."
		fix
	else
		cd "$_gitname" && git pull origin
		msg2 "The local files are updated."
		cd $pkgname
	fi
	msg2 "Making..."
	make >/dev/null
}
fix() {
	sed -i 's/^\$$/$ /' {ncklib/dcerpc.m,idl_compiler/nidlmsg.m}
	sed -i 's/EXTERNAL //' ncklib/comsoc_smb.h
	sed -i 's/demos //' Makefile
	rm -rf demos
	sed -i '/@/d' COPYING
}
package() {
	cd $_gitname/$pkgname
	msg2 "Building..."
	make DESTDIR="$pkgdir" install >/dev/null
	install -D -m444 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	install -D -m755 "$srcdir"/dcerpcd.rc "$pkgdir"/etc/rc.d/dcerpcd
	msg2 "Removing extraneous files..."
	rm "$pkgdir"/etc/dcerpcd.reg
	rmdir "$pkgdir"/var/run
}
