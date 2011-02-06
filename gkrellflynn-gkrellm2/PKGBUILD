# Contributor: BinkyTheClown <binky_at_archlinux_dot_us>
# Contributor: alzen <mynick2_at_gmail_dot_com>
pkgname=gkrellflynn-gkrellm2
pkgver=0.8
pkgrel=3
pkgdesc="Flynn is a tiny system load meter for gkrellm"
url="http://pkgsrc.se/misc/gkrellm-flynn"
license=('GPL')
depends=('gkrellm>=2.0.0')
source=(http://ftp.netbsd.org/pub/NetBSD/packages/distfiles/gkrellflynn-0.8.tar.gz)
md5sums=('19eabecbe7f95e7246012a7be4dff60d')
arch=('i686' 'x86_64')
build() {
  cd $srcdir/gkrellflynn-$pkgver
  make gkrellm2 || return 1
  install -m755 -D gkrellflynn.so $pkgdir/usr/lib/gkrellm2/plugins/gkrellflynn.so
}
