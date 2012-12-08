# Contributor: Jens Pranaitis <jens@jenux.homelinux.org>
# Contributor: nightfrost <khashayar_naderehvandi@yahoo.co.uk>
# Contirbutor: Giorgio Lando <patroclo7@gmail.com>
# Contributor: skottish <skottish97215 AT gmail.com>
# Maintainer:  Federico Cinelli <cinelli.federico@gmail.com>

pkgname=915resolution-static
pkgver=0.5.3
pkgrel=9
pkgdesc="A tool to patch the video BIOS of some Intel graphics chipsets, compiled statically for use in an initramfs"
arch=('i686' 'x86_64')
url="http://915resolution.mango-lang.org/"
license=('custom')
depends=('glibc')
conflicts=(915resolution)
backup=(etc/conf.d/915resolution usr/lib/initcpio/hooks/915resolution)
source=(http://915resolution.mango-lang.org/915resolution-$pkgver.tar.gz
        915resolution.rc.d
        915resolution.conf.d
        915resolution.hook
        915resolution.install
        915resolution-0.5.3-500GMA_945GME_965GM.patch)
md5sums=('ed287778a53d02c31a7a6a52bc146291'
         '4a5e9f60ba800883b361c9bb64ee0220'
         '4df864a584173398f79293014766d575'
         '5c92898b795053bf122ffab770257d25'
         'f742f92c7ab77e391927197505684063'
         '8ceea9da96ba8bace1315810f737f6b0')

build() {
  cd "$srcdir/915resolution-$pkgver"

  patch -Np1 -i "$srcdir/915resolution-0.5.3-500GMA_945GME_965GM.patch"
  make clean
  LDFLAGS="-s -static" make
}

package() {
  cd "$srcdir/915resolution-$pkgver"

  install -D -m755 915resolution "$pkgdir/usr/sbin/915resolution"
  install -D -m755 dump_bios "$pkgdir/usr/sbin/dump_bios"
  install -D -m755 "$srcdir/915resolution.rc.d" "$pkgdir/etc/rc.d/915resolution"
  install -D -m644 "$srcdir/915resolution.conf.d" "$pkgdir/etc/conf.d/915resolution"
  install -D -m644 "$srcdir/915resolution.hook" "$pkgdir/usr/lib/initcpio/hooks/915resolution"
  install -D -m644 "$srcdir/915resolution.install" "$pkgdir/usr/lib/initcpio/install/915resolution"
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/915resolution/LICENSE.txt"
}
