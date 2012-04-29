# Maintainer: lockheed
# Contributor: Steven Davidovitz <steviedizzle ð gmail đ com>
# Contributor: Nick B <Shirakawasuna ð gmail đ com>
# Contributor: Christof Musik <christof ð senfdax đ de>
# Contributor: Stefan Rupp <archlinux ð stefanrupp đ de>
# Contributor: Ignas Anikevicius <anikevicius ð gmail đ com>
_pkgname=tp_smapi

# make the AUR parser think the following lines are comments
# to bypass the buggy parser check
[[ "#" ]] && _kernext=${_kernext:-}
[[ "#" ]] && _kernver=${_kernver:-$(uname -r)}
[[ "#" ]] && _extramodules=$(readlink -f "/lib/modules/$_kernver/extramodules" | sed 's#^/lib/modules/##')
[[ "#" ]] && _kernver=$(< /lib/modules/$_extramodules/version)

pkgname=$_pkgname-pf$_kernext
pkgver=0.41
pkgrel=8
pkgdesc="Modules for ThinkPad's SMAPI functionality, for -pf kernels"
[[ -n $_kernext ]] && pkgdesc+=" (for linux$_kernext)"
arch=('i686' 'x86_64')
url="http://tpctl.sourceforge.net/"
license=('GPL')
depends=("linux$_kernext-pf")
makedepends=("linux$_kernext-headers")
install=$_pkgname-pf.install
source=(https://github.com/downloads/evgeni/tp_smapi/tp_smapi-$pkgver.tar.gz)
md5sums=('63c683415c764568f6bf17c7eabe4752')
sha256sums=('6aef02b92d10360ac9be0db29ae390636be55017990063a092a285c70b54e666')

build() {
  cd "$srcdir/tp_smapi-$pkgver"
  sed -ri "s/^(KVER\s*:=).*$/\1$_kernver/" Makefile
  make HDAPS=1
}

package() {
  make -C "/lib/modules/$_kernver/build" \
  INSTALL_MOD_PATH="$pkgdir" M="$srcdir/$_pkgname-$pkgver" modules_install

  cd "$pkgdir/lib/modules/"
  mv "$_kernver/extra" "$_extramodules"
  rmdir "$_kernver"

  # compress kernel modules
  find "$pkgdir" -name "*.ko" -exec gzip -9 {} +

  # update kernel version in install file
  sed -ri "s/^(extramodules=).*$/\1$_extramodules/" "$startdir/$_pkgname-pf.install"
}
