
pkgname=ghdl-bin-deb
pkgver=0.31
pkgrel=1

pkgdesc="GHDL - a VHDL simulator (from precompiled Debian package)"
arch=('x86_64')
url="http://sourceforge.net/projects/ghdl-updates/"
license=('GPLv2')

conflicts=('ghdl' 'ghdl-bin')
provides=('ghdl')

options=('staticlibs')

# Warning: The Debian packages are extracted manually
# because the content of the archives is the same in all .deb files

source=(
	'http://ftp.debian.org/debian/pool/main/m/mpclib/libmpc2_0.9-4_amd64.deb'
	'http://ftp.debian.org/debian/pool/main/g/gnat-4.6/gnat-4.6-base_4.6.3-8_amd64.deb'
	'http://ftp.debian.org/debian/pool/main/g/gnat-4.6/libgnat-4.6_4.6.3-8_amd64.deb'
	'http://skylink.dl.sourceforge.net/project/ghdl-updates/Builds/ghdl-0.31/Debian/ghdl_0.31-2wheezy1_amd64.deb'
)
noextract=(
	'libmpc2_0.9-4_amd64.deb'
	'gnat-4.6-base_4.6.3-8_amd64.deb'
	'libgnat-4.6_4.6.3-8_amd64.deb'
	'ghdl_0.31-2wheezy1_amd64.deb'
)
md5sums=(
	'dd60913f28496c953e0291a7c1cf08a1'
	'81400aaadd0e6d011620012a4f2c831d'
	'ec6f623367f47f6213cf42f0ff0b50d4'
	'98a361adda5a82bf60cd730e6d3541d5'
)

package() {
	cd "$srcdir"

	ar p libmpc2_0.9-4_amd64.deb         data.tar.gz | tar -C "${pkgdir}" -zx
	ar p gnat-4.6-base_4.6.3-8_amd64.deb data.tar.gz | tar -C "${pkgdir}" -zx
	ar p libgnat-4.6_4.6.3-8_amd64.deb   data.tar.gz | tar -C "${pkgdir}" -zx
	ar p ghdl_0.31-2wheezy1_amd64.deb    data.tar.gz | tar -C "${pkgdir}" -zx

	ln -s "/usr/lib/x86_64-linux-gnu/libmpc.so.2"      "${pkgdir}/usr/lib/libmpc.so.2"
	ln -s "/usr/lib/x86_64-linux-gnu/libgnat-4.6.so.1" "${pkgdir}/usr/lib/libgnat-4.6.so.1"
}
