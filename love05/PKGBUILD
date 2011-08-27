# Contributor: Eric Forgeot < http://anamnese.online.fr > & dreeze
pkgname=love05
pkgver=0.5
pkgrel=2
pkgdesc="LOVE is an open-source 2D game engine which uses the versatile Lua scripting language to create dynamic gaming experiences."
arch=(i686 x86_64)
url="http://love2d.org/"
license=('zlib')
#conflicts=('')
depends=('glibc' 'mesa' 'boost' 'sdl' 'sdl_mixer' 'devil' 'freetype2' 'lua' 'physfs')
makedepends=('')
source=(http://downloads.sourceforge.net/sourceforge/love/love-$pkgver-0.tar.gz)
md5sums=('56019fe945a445ad004428fc595a3848')

build() {
cd $srcdir/love-$pkgver-0
patch -p1 <$startdir/love-patch.diff

./configure --prefix=/usr CXXFLAGS="$CXXFLAGS"
make || return 1
make DESTDIR=$startdir/pkg install || return 1
mv $pkgdir/usr/bin/love $pkgdir/usr/bin/love-05
#echo -e "\n\nYou'll have to create a symbolic link from /usr/bin/love05 to /usr/bin/love otherwise it won't work.\n\n"
} 
