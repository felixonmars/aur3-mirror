# Contributor: graysky <graysky AT archlinux dot us>

pkgname=turbostat
pkgver=4.1
pkgrel=1
_srcname=linux-4.0
pkgdesc="Newer version of turbostat-shows CPU frequency and C-state residency on modern Intel turbo-capable processors."
arch=('x86_64' 'i686')
url="http://acpi.sourceforge.net/dsdt/index.php"
license=('GPL')
conflicts=('pmtools')
source=("http://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.xz")
#"http://www.kernel.org/pub/linux/kernel/v3.x/patch-${pkgver}.xz")

sha256sums=('0f2f7d44979bc8f71c4fc5d3308c03499c26a824dd311fdf6eef4dee0d7d5991')

#prepare() {
#  cd "$_srcname"
#  patch -p1 -i "${srcdir}/patch-${pkgver}"
#}

build() {
  cd "$_srcname/tools/power/x86/$pkgname"
  make
}

package() {
  cd "$_srcname/tools/power/x86/$pkgname"
  make DESTDIR="$pkgdir" install
}
