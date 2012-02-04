# Maintainer:  Peter B. Jørgensen <peterbjorgensen{AT]gmail[DOT}com>
# Adopted from qemu-git from AUR

pkgname=qemu-m68k-git
pkgver=20100406
pkgrel=1
pkgdesc="Processor emulator and virtual machine with with expansive multi-arch support and fast operation (with an accelerator), fork with m680x0 patches."
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2')
url="http://www.nongnu.org/qemu/"

makedepends=('git')
depends=('zlib' 'e2fsprogs' 'gnutls>=2.4.1' 'sdl' 'alsa-lib')
conflicts=('qemu' 'kvm')
provides=('qemu')

source=('65-kvm.rules'
        '70-kqemu.rules')
sha256sums=('84df4528284e5039e225aa6b2d53005dc9e525d264b117b32761904abbe7da26'
            'f68a919d5c99252759e5349cc573a44a0619e20e29d97b6a0f26d6861deed41c')
install="$pkgname.install"

_gitroot="git://gitorious.org/qemu-m68k/qemu-m68k.git"
_gitname=qemu-m68k


build() {
	msg "Performing source checkout..."
	if [ -d "$_gitname" ]; then
		cd "$_gitname"
		git pull origin || return 1
		cd ..
	else
		git clone "$_gitroot" || return 1
	fi
	msg "Source checkout finished."
	rm -rf "$_gitname-build"
	git clone "$_gitname" "$_gitname-build" || return 1
	
	cd "$_gitname-build"

	sed -i -e 's/lib64/lib/g' x86_64.ld || return 1

	./configure --prefix=/usr --audio-drv-list=alsa,oss,sdl \
	            --audio-card-list=ac97,sb16,es1370 --disable-bluez \
		    --kerneldir="/usr/src/linux-$(uname -r)" || return 1
	make || return 1
	make DESTDIR="$pkgdir" install || return 1

	install -Dm644 "$srcdir/70-kqemu.rules" \
	               "$pkgdir/lib/udev/rules.d/70-kqemu.rules"
	install -Dm644 "$srcdir/65-kvm.rules" \
	               "$pkgdir/lib/udev/rules.d/65-kvm.rules"
}
