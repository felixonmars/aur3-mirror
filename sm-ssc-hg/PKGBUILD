# Maintainer: Ryan Peters <sloshy45 at sbcglobal dot net>
# Original Maintainer: Artefact2 <artefact2@gmail.com>
# Contributor: Lauri Niskanen <ape@ape3000.com>
# Contributor: Travis Nickles <ryoohki7@yahoo.com>
# Contributor: Stefan Lohmaier <noneuss at gmail dot com>
#
# NOTE: This package is forked from the original sm-ssc PKGBUILD
# and all credit goes to Artefact2, the maintainer of sm-ssc's PKGBUILD.

pkgname=sm-ssc-hg
pkgver=20110510
pkgrel=2
pkgdesc="Latest sm-ssc build, a Stepmania fork to become Stepmania 5."
url="http://code.google.com/p/sm-ssc/"
license="MIT"
arch=(i686 x86_64)
depends=('gtk2' 'libmad' 'libtheora' 'mesa' 'ffmpeg')
provides=('stepmania')
makedepends=('pkgconfig' 'mercurial')
install='sm-ssc.install'
source=(sm-ssc.sh sm-ssc.install archlinux.patch)
sha512sums=('1f947a417b081cefd6e1dfdb4b236d9355c9b0a697697b292213021c01e2759f6e4405f3c2c7e2f7354576a305604adf7d5daa95ceca8f135d0de97fcb237d2c'            '67d11a649801b654108f4bb20a9d395e8e63f1a1484b4a6ada06bf0607a85339bea91cf0b2f32da7903129b0f2346824ff6038bd33523d990d8e2a7f459075ff'            'dd77bf1f35946ca97740473f5a0b074030076bb02aca945570b3aee4bffcef9fedcc41f8a6ac409f4ac8c6a45de80236616f099bac6127c18aabf4a54c3b7bd6')

_mercurial_repo=https://sm-ssc.googlecode.com/hg/
_dir=sm-ssc
_realver="v$pkgver"

build() {
    cd $srcdir

    msg "Connecting to sm-ssc mercurial server...."
    hg clone $_mercurial_repo $_dir
	cd $_dir
    msg "Repository cloning done or server timeout"
    msg "Starting make..."

	patch -p1 < $srcdir/archlinux.patch

    sh ./autogen.sh || return 1
	sh ./Utils/build.sh -f || return 1
	sh ./Utils/build.sh -c || return 1
	sed -i -e 's/ -lrt/ -lbz2 -lrt/g' _build/src/Makefile _build/Makefile
    sh ./Utils/build.sh --verbose --verbose || return 1
    mkdir -p $pkgdir/opt/$pkgname Songs RandomMovies Packages
    cp stepmania GtkModule.so $pkgdir/opt/$pkgname

    install -D -m755 $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname
	install -D -m644 $srcdir/$_dir/Docs/Licenses.txt $pkgdir/usr/share/licenses/$pkgname/Licenses.txt

	folders=`echo {Announcers,BackgroundEffects,BackgroundTransitions,BGAnimations,CDTitles,Characters,Courses,Data,Docs,NoteSkins,Packages,RandomMovies,Songs,Themes}`

    cp -r $folders $pkgdir/opt/$pkgname
	chown -R root:games $pkgdir/opt/$pkgname
	cd $pkgdir/opt/$pkgname
	chmod 2775 . $folders
}
