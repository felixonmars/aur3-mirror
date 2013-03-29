# Maintainer:  jsteel <mail at jsteel dot org>
# Contributor: Devin Cofer <ranguvar{AT]archlinux[DOT}us>
# Contributor: damir <damir@archlinux.org>
# Contributor: Ben <contrasutra@myrealbox.com>

pkgname=elinks-pre
_pkgname=elinks
pkgver=0.12pre6
pkgrel=1
pkgdesc="Text-mode web browser with tabs, MIME support, scripting, and other advanced features (Prerelease version)"
arch=('i686' 'x86_64')
url="http://elinks.or.cz"
license=('GPL2')
depends=('bzip2' 'expat>=2.0' 'gpm>=1.20.4' 'openssl' 'zlib' 'lua>=5.1.1'
        'libidn' 'js' 'perl' 'tre' 'gc')
provides=('elinks')
conflicts=('elinks' 'elinks-git')
source=(http://elinks.or.cz/download/$_pkgname-$pkgver.tar.bz2)
sha256sums=('383646375b8a325bef5a132c8300caab90eb0b842c5f8eff68febc00e29acada')

build() {
  cd "$_pkgname-$pkgver"

  ./configure --prefix=/usr --mandir=/usr/share/man --sysconfdir=/etc \
      --disable-smb --without-x --enable-cgi --enable-leds --enable-256-colors \
      --enable-html-highlight --with-zlib

  make
}

package() {
  cd "$_pkgname-$pkgver"

  make DESTDIR="$pkgdir"/ install

  rm -f "$pkgdir/usr/share/locale/locale.alias"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
