# Maintainer:  Matt Monaco <net 0x01b dgbaley27>

__gitroot="git://github.com/CPqD/ofdissector.git"
__gitname="ofdissector.git"
__gitcommit="master"

_wireshark_version=1.8.3

pkgname=wireshark-plugin-openflow
pkgver=0.3+git
pkgrel=2
pkgdesc="The OpenFlow dissector for Wireshark."
url="http://www.openflow.org"
license=(custom)
arch=(x86_64 i686)
depends=("wireshark-cli=$_wireshark_version")
makedepends=(git scons)

build()
{
	_git_setup
	cd "$srcdir/$pkgname-$pkgver/src"

	sed -i 's|^target_install.*|target_install = target_plugin|' Sconstruct

	export WIRESHARK=/usr/include/wireshark
	scons install
	install -D ../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package()
{
	cd "$srcdir/$pkgname-$pkgver/src"
	install -D openflow.so "$pkgdir/usr/lib/wireshark/plugins/$_wireshark_version/openflow.so"
}

_git_setup() {

	cd "$SRCDEST"
	
	if [[ ! -d "$__gitname" ]]; then
		msg2 "Cloning git repository"
		git clone --mirror "$__gitroot" "$__gitname"
	else
		msg2 "Updating git repository"
		cd "$__gitname"
		git fetch
	fi

	cd "$srcdir"
	if [[ -d "$pkgname-$pkgver" ]]; then
		msg2 "Removing previous build tree"
		rm -fr "$pkgname-$pkgver"
	fi

	msg2 "Creating fresh build tree"
	git clone --depth=1 -b "$__gitcommit" "file://$SRCDEST/$__gitname" "$pkgname-$pkgver"
}
