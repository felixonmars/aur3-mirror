# Contributor: Jens Pranaitis <jens@jenux.homelinux.org>
# Contributor: nightfrost <khashayar_naderehvandi@yahoo.co.uk>
# Contirbutor: Giorgio Lando <patroclo7@gmail.com>
# Contributor: skottish <skottish97215 AT gmail.com>
pkgname=915resolution-static
pkgver=0.5.3
pkgrel=6
pkgdesc="A tool to patch the video BIOS of some Intel graphics chipsets, compiled statically for use in an initramfs"
arch=('i686' 'x86_64')
url="http://915resolution.mango-lang.org/"
license=('custom')
depends=('glibc')
conflicts=(915resolution)
backup=(etc/conf.d/915resolution lib/initcpio/hooks/915resolution)
source=(http://915resolution.mango-lang.org/915resolution-$pkgver.tar.gz 915resolution.rc.d 915resolution.conf.d 915resolution.hook 915resolution.install 915resolution-0.5.3-500GMA_945GME_965GM.patch)

build() {
  cd $startdir/src/915resolution-$pkgver
  patch -Np1 -i $srcdir/915resolution-0.5.3-500GMA_945GME_965GM.patch
  make clean
  LDFLAGS="-s -static" make || return 1
  install -D -m755 915resolution $startdir/pkg/usr/sbin/915resolution
  install -m755 dump_bios $startdir/pkg/usr/sbin
  install -D -m755 ../915resolution.rc.d $startdir/pkg/etc/rc.d/915resolution
  install -D -m644 ../915resolution.conf.d $startdir/pkg/etc/conf.d/915resolution
  install -D -m644 ../915resolution.hook $startdir/pkg/lib/initcpio/hooks/915resolution
  install -D -m644 ../915resolution.install $startdir/pkg/lib/initcpio/install/915resolution
  install -D -m644 LICENSE.txt $startdir/pkg/usr/share/licenses/915resolution/LICENSE.txt
}

md5sums=('ed287778a53d02c31a7a6a52bc146291'
         '4a5e9f60ba800883b361c9bb64ee0220'
         '4df864a584173398f79293014766d575'
         '5c92898b795053bf122ffab770257d25'
         'ccaea4ec441c017c16ffd679fa5bd203'
         '8ceea9da96ba8bace1315810f737f6b0')
