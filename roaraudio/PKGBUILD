# Maintainer: Hans-Kristian Arntzen <maister@archlinux.us>
# Contributor: Magnus Wild

pkgname=roaraudio
pkgver=1.0beta4
_pkgbase=1.0beta4
pkgrel=1
pkgdesc="RoarAudio is a server for audio mixing. It's main purpose is to mix audio from different clients before sending it to the soundcard. It also supports network clients because of it's full network transparency."
arch=('i686' 'x86_64')
url="http://roaraudio.keep-cool.org/"
license=('GPLv3' 'LGPLv3')
depends=(openslp libvorbis)
source=(http://roaraudio.keep-cool.org/dl/$pkgname-$_pkgbase.tar.gz roard)
md5sums=('8cce2d932367457f9c0249643825576b'
         '4a343eb04cb3aedc4bf2867e262f3d1d')

build() 
{
   cd "$srcdir/$pkgname-$_pkgbase"

   ./configure --distribution-version-string "Arch Linux $pkgver-$pkgrel" --without-beta --runtime-detect --prefix /usr  || return 1

   make || return 1
}

package()
{
   cd "$srcdir/$pkgname-$_pkgbase"
   mkdir -p "$pkgdir/etc/rc.d/"
   mkdir -p "$pkgdir/usr/bin/"
   make DESTDIR="$pkgdir" install || return 1
   install -m755 "$srcdir/roard" "$pkgdir/etc/rc.d/" || return 1
}

