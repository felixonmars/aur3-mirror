# Maintainer: dundee <daniel@milde.cz>
# Contributor: Lauri Niskanen <ape@ape3000.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: metzen <metzen@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=hamachi
pkgver=0.9.9.9_20
_pkgver=0.9.9.9-20
pkgrel=7
pkgdesc="zero-configuration virtual private networking tool"
url="http://www.hamachi.cc/"
license=('custom')
[ "${CARCH}" = "x86_64" ] && depends=('lib32-glibc' 'lib32-gcc-libs')
arch=('i686' 'x86_64')
install=hamachi.install
options=('!strip')
source=("http://files.hamachi.cc/linux/$pkgname-$_pkgver-lnx.tar.gz"
	'tuntap' 'tuncfg-x86_64.patch' 'fix-open-lock.patch')
md5sums=('27e4c926d0aa03de3573c0b7acf032a6'
	'4c8d1ce5bfff40bbda7705e220ab05e2'
	'5b27616ff3cada53afa449f4e3a1f0ba'
	'd302055a5e70fc80c47ffc4f0e6f29d6')

build() {
  cd $srcdir/$pkgname-$_pkgver-lnx/tuncfg

  [ "${CARCH}" = "x86_64" ] && patch -p0 < $srcdir/tuncfg-x86_64.patch

  # Fix misuse of open() function
  # example: https://bugzilla.redhat.com/show_bug.cgi?id=330971
  patch -p0 -i $srcdir/fix-open-lock.patch

  make clean
  make
}

package() { 
  cd $srcdir/$pkgname-$_pkgver-lnx
  
  install -Dm 755 hamachi "$pkgdir/usr/bin/hamachi"
  ln -sf hamachi "$pkgdir/usr/bin/hamachi-init"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 LICENSE.tuncfg "$pkgdir/usr/share/licenses/$pkgname/LICENSE.tuncfg"
  install -Dm 644 README "$pkgdir/usr/share/doc/hamachi/README"
  
  cd $srcdir/$pkgname-$_pkgver-lnx/tuncfg
  
  install -Dm 700 tuncfg "$pkgdir/usr/sbin/tuncfg"
  install -Dm 755 "$srcdir/tuntap" "$pkgdir/etc/rc.d/tuntap"
}
