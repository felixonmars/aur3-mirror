# Maintainer: David Manouchehri <david@davidmanouchehri.com>

pkgname=easycap-smi2021
_gitname=smi2021
_gitbranch=smi2021v3-wip
_gitauthor=jonjonarnearne
pkgrel=1
pkgver=ca8eea2
pkgdesc="EasyCap driver module"
license=('GPL')
arch=('i686' 'x86_64')
url='https://github.com/jonjonarnearne/smi2021'
source=("https://github.com/stevelacy/EasyCap/raw/master/somagic_firmware.bin")
sha512sums=('722128600bd982b1ff6af8e372e361d22ee872282aeab50b62d8769ad2ee08bb2c6612f59ba48736a26c2c47704a7e192af2746ac0746a074bc3aa242bffa712')

# The current branch requires you to download the entire kernel, which is extremely wasteful; this is a bit of a quick hack, feel free to fix it.
prepare() {
	# Get source
	cd "$srcdir"
	[ -d "$_gitname" ] || mkdir "$_gitname" 
	cd "$_gitname"
	git init || true  # Force
	git config core.sparseCheckout true
	echo drivers/media/usb/smi2021/ > .git/info/sparse-checkout
	git remote add origin https://github.com/jonjonarnearne/smi2021.git || true
	git fetch origin --depth=1
	git pull origin "$_gitbranch"
}

# Unfortunately, I cannot get pkgver() to work with sparse-checkout in a sane matter, sorry.
pkgver() {
	curl -v --silent https://github.com/jonjonarnearne/smi2021 2>&1 | grep -o "data-clipboard-text=\".*\" d" | awk -F\" '{print $2}' | cut -c -7
	#cd "$srcdir/$_gitname"
	#(	
	#	set -o pipefail
	#	git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	#	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	#)
}

build() {
	cd "$srcdir/$_gitname/drivers/media/usb/smi2021"
	sed -i '0,/obj/{s/$(CONFIG_VIDEO_SMI2021)/m/}' Makefile
	make -C /lib/modules/$(uname -r)/build M=$PWD modules
}

package() {
	_major=$(pacman -Q linux | grep -Po "\d+\.\d+")
	_extramodules=extramodules-$_major-ARCH
	_kernel=$(cat /usr/lib/modules/$_extramodules/version)
	install -Dm644 "$srcdir/$_gitname/drivers/media/usb/smi2021/smi2021.ko" "$pkgdir/usr/lib/modules/$_extramodules/smi2021.ko"
	find "$pkgdir" -name '*.ko' -exec gzip -9 {} \;

	install -Dm644 "$srcdir/somagic_firmware.bin" "$pkgdir/usr/lib/firmware/smi2021_3c.bin"
}