# Contributor: Sapphira Armageddos <shadowkyogre@aim.com>
pkgname=magicseteditor-xyz-mod
pkgver=2.0.0
pkgrel=6
pkgdesc="A program to help create Magic: the Gathering cards and sets. YugiOh template has xyz additions."
arch=('i686' 'x86_64')
url="http://magicseteditor.sourceforge.net"
license=('GPL')
depends=('hunspell' 'libjpeg' 'wxgtk' 'boost-libs')
makedepends=('boost' 'unzip')
provides=("magicseteditor=${pkgver}")
conflicts=('magicseteditor-bin' 'magicseteditor-svn' 'mse2')
source=(
#'xyz_modifications.patch'
#'card-xyz.jpg'
#'xstar.png'
'http://dl.dropbox.com/u/12096853/XyzV5.zip'
"magic-mana-small-and-large.mse-installer::http://mtg.pifro.com/download/file.php?id=2850"
"magic-mana-future.mse-installer::http://mtg.pifro.com/download/file.php?id=2849"
"magic-mana-beveled.mse-installer::http://mtg.pifro.com/download/file.php?id=2848"
"magic.mse-installer::http://mtg.pifro.com/download/file.php?id=2865")
install=$pkgname.install
options=(!strip)

#md5sums=('74dd008fc6e052df142b0fc50ad470d2'
#         '3d57814678741d8a3e6beb52e0ceec75'
#         '2d5b66fef73962ca06af2294141861c7'
#         'cfd7da8c7c212f109adb5aa26da8b780'
#         '0e95f967272ce328b1bb35d517a62ba2'
#         '91175d86443564b3dfbb539a992957a6'
#         'f6d2d34606cbf95dafd9f1ffb7756105')

md5sums=('e3c993472885fd01ceb12c945ab232b5'
         'cfd7da8c7c212f109adb5aa26da8b780'
         '0e95f967272ce328b1bb35d517a62ba2'
         '91175d86443564b3dfbb539a992957a6'
         'f6d2d34606cbf95dafd9f1ffb7756105')

noextract=('XyzV5.zip')

build() {
	cd $srcdir
	#because grabbing the source directly via this causes the md5sum to change due to slight differences
	unzip XyzV5.zip
	bsdtar -xf magic-mana-small-and-large.mse-installer
	bsdtar -xf magic-mana-future.mse-installer
	bsdtar -xf magic-mana-beveled.mse-installer
	bsdtar -xf magic.mse-installer
	wget http://magicseteditor.svn.sourceforge.net/viewvc/magicseteditor/tags/releases/mse-${pkgver}/?view=tar -O magicseteditor-mse-${pkgver}.tar.gz
	bsdtar -xf magicseteditor-mse-${pkgver}.tar.gz
	rm -vf ./*.mse-symbol-font/build.bat
	cp -r ./*.mse-{symbol-font,game,include} ./mse-${pkgver}/data
	cp -r ./data/* ./mse-${pkgver}/data
	cd ./mse-${pkgver}
	#patch -Np1 --verbose -i $srcdir/xyz_modifications.patch
	#cp $srcdir/xstar.png ./data/yugioh-standard-levels.mse-symbol-font
	#cp $srcdir/card-xyz.jpg ./data/yugioh-standard.mse-style
	./configure --prefix=/usr
	sed -e 's|^\(AM_LDFLAGS = .*\),--as-needed|\1,-Bsymbolic-functions|' -i Makefile
	make LIBS=-lhunspell-1.3 CPPFLAGS=-I/usr/include/hunspell || return 1

}

package()
{
	cd ./mse-${pkgver}
	make DESTDIR=$pkgdir install || return 1
	mkdir -p $pkgdir/usr/share/magicseteditor/resource
	cp -r ./data $pkgdir/usr/share/magicseteditor
	cp -r ./src/resource/common/* $pkgdir/usr/share/magicseteditor/resource
	cp -r ./src/resource/msw/other/* $pkgdir/usr/share/magicseteditor/resource
	cp -r ./src/resource/msw/{cursor,icon,tool} $pkgdir/usr/share/magicseteditor/resource
	rm -rf $pkgdir/usr/share/magicseteditor/resource/{cursor,icon,tool}/.svn
	rm -rf $pkgdir/usr/share/magicseteditor/data/.svn
	rm -rf $pkgdir/usr/share/magicseteditor/data/*/.svn
}

# vim:set ts=2 sw=2 et:
