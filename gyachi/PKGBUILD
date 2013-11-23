# Maintainer: Mamut Ghiunhan
# Contributors: Conor Callahan, Alexandru Mizeranschi, TDY, Ionut Biru, Dan Serban

pkgname=gyachi
pkgver=1.2.11
pkgrel=4
pkgdesc="An improved fork of the GyachE Yahoo client"
arch=(i686 x86_64)
url=http://gyachi.sourceforge.net/
license=(GPL)
depends=(gpgme gtkspell jasper gtkhtml webkitgtk webkitgtk2 libmcrypt libtool libv4l aspell-en)
makedepends=(alsa-lib imagemagick pkgconfig automake-1.11 libpulse)
optdepends=('pulseaudio: for pulseaudio support')
options=('!libtool')
source=(http://downloads.sourceforge.net/project/gyachi/gyachi/$pkgver/$pkgname-$pkgver.tar.gz autogen.sh.patch)
md5sums=('c2cb665ced3bbdc66cf37320f291726c'
         '2862e94e1acd3e2626174519c3d5153a')

prepare()
{
    cd "$srcdir/$pkgname-$pkgver"
    patch -p1 -i $srcdir/autogen.sh.patch
    export CFLAGS="$CFLAGS -D_FILE_OFFSET_BITS=64"
}

build()
{  
    cd "$srcdir/$pkgname-$pkgver"
    ./autogen.sh
    ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib/gyachi \
    --disable-rpath \
    --disable-wine \
    --disable-gtktest \
    --disable-glibtest \
    --disable-plugin_libnotify \
    --with-x
    make
}

package()
{
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="${pkgdir}" install
    install -Dm644 "${pkgdir}"/usr/share/gyachi/themes/gyachi-classic/gyach-icon_48.png "${pkgdir}"/usr/share/pixmaps/${pkgname}.png
}

