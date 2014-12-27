# Maintainer: Duncan K. <duncank@fastmail.fm>

pkgname=crawl-hib
pkgver=0.2.00
_hibver=0-2-00
pkgrel=1
pkgdesc='Local multiplayer dungeon crawler where your friends control the monsters (Humble Bundle version)'
url='http://www.powerhoof.com/crawl/'
arch=('i686' 'x86_64')
license=('custom:commercial')
depends=('glu' 'libxcursor' 'alsa-lib')
optdepends=('libpulse: PulseAudio support')
options=('!strip' '!upx')
PKGEXT='.pkg.tar.gz'
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

if [ $CARCH == i686 ]; then
	_binext='x86'
else
	_binext='x86_64'
fi

_installer="crawl-${_hibver}-linux.tar.gz"
_bin="Crawl.${_binext}"

source=("hib://${_installer}")
sha256sums=('bacdf09a900f758595d3f3dc84f78a14176f29d60792d7e19f0faf329963c759')

package() {
	cd $srcdir
	_installdir="/opt/crawl"; _target=$pkgdir/$_installdir

	# Install game files
	mkdir -p $_target
	cp -r "Crawl_Data" $_target
	cp $_bin $_target

	# Link executable
	install -d "${pkgdir}/usr/bin"
	ln -s ${_installdir}/${_bin} "${pkgdir}/usr/bin/crawl-powerhoof"
}
