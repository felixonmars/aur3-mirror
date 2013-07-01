# Maintainer: kozec <kozec at kozec dot com>

pkgname=akaneiro
_ver=0.2.6
_subver=6
pkgver=${_ver}.${_subver}
pkgrel=2
pkgdesc="Akaneiro game launcher (converted from deb package)"
arch=('i686' 'x86_64')
url="http://spicyhorse.com"
license=('custom')
depends=('boost-libs' 'glibc' 'gcc-libs' 'qt4' 'libx11' 'glu' 'libgl'
		'libtorrent-rasterbar>=1:0.16.10' 'bzip2' 'libxext')

if [ "$CARCH" = "i686" ]; then
	_debname="akaneiro-launcher_${_ver}-${_subver}_i386.deb"
	_arch="i386"
	_md5='dfad68fcc26c82978d7297dbf2e4ffed'
elif [ "$CARCH" = "x86_64" ]; then
	_debname="akaneiro-launcher_${_ver}-${_subver}_amd64.deb"
	_arch="amd64"
	_md5='b1c23c278627ef34ece82f1b46e78bc7'
fi
source=("http://download.opensuse.org/repositories/home:/Spicyhorse/xUbuntu_13.04/${_arch}/${_debname}"
		"launcher")
md5sums=(${_md5} "285a3aea676202d5b058dacc99b5577f")

build() {
	true 
}  

package() {
	cd "$pkgdir"
	tar xvfz "$srcdir/data.tar.gz" || return 1
	mkdir -p "usr/lib/akaneiro"
	mv "usr/bin/akaneiro-launcher" "usr/lib/akaneiro/akaneiro-launcher" 
	install -m0755 "$srcdir/launcher" "usr/bin/akaneiro-launcher"
	ln -s "/usr/lib/libboost_system.so" "usr/lib/akaneiro/libboost_system.so.1.49.0"
	ln -s "/usr/lib/libboost_system.so" "usr/lib/akaneiro/libboost_system.so.1.52.0"
	ln -s "/usr/lib/libboost_system.so" "usr/lib/akaneiro/libboost_system.so.1.53.0"
}
