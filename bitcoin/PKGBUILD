## Maintainer : shahid <helllamer@gmail.com>
## Long PKGBUILD description, todo, wiki:
## * https://bitbucket.org/helllamer/archlinux-pkgbuild/wiki/pkgbuild/bitcoin

## Wanna take part on development my PKGBUILDs? Feel welcome on my repo:
## * https://bitbucket.org/helllamer/archlinux-pkgbuild/

name=bitcoin
pkgname=$name
pkgver=0.6.0
pkgrel=2
pkgdesc="Bitcoin is a peer-to-peer network based digital currency."
arch=('i686' 'x86_64')
url="http://www.bitcoin.org/"
depends=('qt>=4.6' 'libpng>=1.4' 'expat' 'gcc-libs' 'boost-libs>=1.46' 'miniupnpc>=1.6' 'openssl')
makedepends=('boost' 'gcc' 'make' 'automoc4')
conflicts=('bitcoin-bin' 'bitcoin-git' 'bitcoin-daemon')
license=('MIT')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}-linux.tar.gz")

## global vars for dirs and files
s1=$srcdir/${pkgname}-${pkgver}-linux
src_root=$s1/src
src_qt=$src_root
src_d=$src_root/src
src_deb=$src_root/contrib/debian
makefile_unix=makefile.unix

build() {
	cd $src_d

	msg "Patching $makefile_unix..."
	sed -i $makefile_unix \
		-e 's/-Bstatic/--as-needed ${LDFLAGS}/g' \
		-e 's/\(-DNOPCH\)/\1 -DBOOST_FILESYSTEM_VERSION=2/' \
		-e 's/\(USE_UPNP:=\)0/\11/' \
		-e 's/$(DEBUGFLAGS)//g' \
		-e 's/CXXFLAGS/CPPFLAGS/g' \
		-e 's/-O[0-3]/${CXXFLAGS}/g'

	# make bitcoind
	make $MAKEFLAGS -f $makefile_unix bitcoind

	# and make qt gui
	cd $src_qt
	qmake
	make $MAKEFLAGS
}


package() {
	## Grab debian .install files here.
	## First, create directories:
	cat $src_deb/*.install | cut -d\  -f2 | sort | uniq | xargs -I{} mkdir -p $pkgdir/{}

	## Copy needed files into created dir-s:
	cat $src_deb/*.install | deb_paths_pp | apply_deb_install

	## Copy mans
	cat $src_deb/*.manpages | deb_paths_pp | install_man

	## Copy examples
	mkdir -p $pkgdir/usr/share/bitcoin
	cat $src_deb/*.examples | deb_paths_pp | xargs -I{} install $src_root/{} $pkgdir/usr/share/bitcoin/

	find $pkgdir/usr/share/ -type f | xargs chmod -x 
}

## convert paths from .install and other files: "debian/" -> "contrib/debian/"
deb_paths_pp() { sed -e 's@^\(debian\)@contrib/\1@'; }

## reading input in "<from> <to>"-manner and convert it
apply_deb_install() {
    while read from to ; do
	install $src_root/$from $pkgdir/$to
    done
}

## guess correct /usr/share/man's subdirectory for man every file
## FIXME Uber-fat crunch. It should another, simple way...
install_man() {
    while read man; do
	local man_d="$pkgdir/usr/share/man/man${man#${man%?}}/"
	mkdir -p $man_d
	install -D $src_root/$man $man_d
    done
}

## makepkg -g >> PKGBUILD
md5sums=('d0289e10c5433b37b485755a92c0be64')
