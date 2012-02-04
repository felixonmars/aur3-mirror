# Maintainer: Michael Duell <mail@akurei.me> PGP-Key: 6EE23EBE
## Contributor : shahid <helllamer@gmail.com>

pkgname=bitcoin-noforcedfee
_pkgbasename=bitcoin
pkgver=0.4.0
pkgrel=1
pkgdesc="Bitcoin is a peer-to-peer network based digital currency. This version does not force you to pay a transaction fee."
arch=('i686' 'x86_64')
url="http://www.bitcoin.org/"
depends=('wxgtk-2.9' 'expat' 'gcc-libs' 'boost-libs>=1.46' 'miniupnpc>=1.6' 'openssl')
makedepends=('boost' 'gcc' 'make' 'findutils')
conflicts=('bitcoin-bin' 'bitcoin-git' 'bitcoin-daemon' 'bitcoin')
license=('MIT')
source=("http://downloads.sourceforge.net/sourceforge/${_pkgbasename}/${_pkgbasename}-${pkgver}-linux.tar.gz"
	"${_pkgbasename}.desktop"
  "nofee.patch")
s1=$srcdir/${_pkgbasename}-${pkgver}-linux
src=$s1/src/src/
makefile_unix=makefile.unix

build() {
	cd $src
  msg "Patching nofee patch"
  patch -p0 < $srcdir/nofee.patch

	msg "Patching $makefile_unix..."
	sed -i $makefile_unix \
		-e 's/\(-DNOPCH\)/\1 -DBOOST_FILESYSTEM_VERSION=2/' \
		-e 's/\(wx-config\)/\1-2.9/g' \
		-e 's/-Bstatic/--as-needed ${LDFLAGS}/g' \
		-e 's/\(USE_UPNP:=\)0/\11/' \
		-e 's/$(DEBUGFLAGS)//g' \
		-e 's/CXXFLAGS/CPPFLAGS/g' \
		-e 's/-O[0-3]/${CXXFLAGS}/g'

	# single-threaded build due to OOM issues reported
	make -j1 -f $makefile_unix bitcoin bitcoind
}

# remove shit from macosx faggots
rm_macosx_shit() {
        pushd $srcdir
        find | grep bitcoin | grep '/\._' | xargs rm
        popd
}

package() {
        rm_macosx_shit >/dev/null

	# get compiled binaries
	mkdir -p $pkgdir/usr/bin
	install -D -m755 $src/bitcoin  $pkgdir/usr/bin/
	install -D -m755 $src/bitcoind $pkgdir/usr/bin/

	# install locales (FIXME bicycle with find|xargs)
	mkdir -p $pkgdir/usr/share/locale
	cd $s1/locale/
	find -name *.mo | xargs -I{} install -D -m644 {} $pkgdir/usr/share/locale/{}
	
	# add icon and .desktop file to pkg
	mkdir -p $pkgdir/usr/share/pixmaps
	install -D -m644 $src/xpm/bitcoin48.xpm $pkgdir/usr/share/pixmaps/

	mkdir -p $pkgdir/usr/share/applications
	install -D -m644 $srcdir/${_pkgbasename}.desktop $pkgdir/usr/share/applications/

}
sha512sums=('370ea8c9a910fd99e3108832d3da0a5ca8517a7ef3aeefeaafef8804110c0aad2ab72da7583af0ac3cb04370a714cbfa2ca5f977fabd13e39d6a83502592e4c2'
            '4f896bf643b98e4696a4fc51fe441247e655944c4edc22bef225ca5f9bd0aeaee7b389246c125e0a8d9a0dd5e283e7f7fe8b562d4afadec7141b82c181aa1c5f'
            'f30c407da2801c62cf6580b30e870f1c1eea0157b9cbbca395d87928a9c69f4011cc254ce62c82140c2a8c16c763ebd8ae571e5e5cfebcc8ded3624f402905b3')
