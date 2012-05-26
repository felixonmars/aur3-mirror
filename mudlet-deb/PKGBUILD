# Contributor: A. Fluteaux <sigma_g@melix.net>
pkgname=mudlet-deb
pkgver=20120526
pkgrel=2
ppaver=2.0-rc12-2.1
pkgdesc="Ubuntu version of mudlet"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/mudlet/"
license=('GPL')
depends=('lua' 'qt' 'yajl>=2' 'phonon' 'mesa' 'hunspell' 'luajit')
makedepends=('deb2targz')
conflicts=('mudlet' 'mudlet-git')
provides=('mudlet')
source=("http://ppa.launchpad.net/mudlet-makers/ppa/ubuntu/pool/main/m/mudlet/mudlet_${ppaver}ubuntu1_i386.deb")
md5sums=('29597df38e1b04c5d36c00d94de7866d')

build() {
	deb2targz "${srcdir}/mudlet_${ppaver}ubuntu1_i386.deb"

    cd "${pkgdir}"
	# I had no better idea, sorry ...
	[ -f /usr/lib/libpcre.so.3 ] || (mkdir -p usr/lib;ln -s /usr/lib/libpcre.so usr/lib/libpcre.so.3)
	tar xzf "${srcdir}/mudlet_${ppaver}ubuntu1_i386.tar.gz"
}

package() {
	echo done
}
