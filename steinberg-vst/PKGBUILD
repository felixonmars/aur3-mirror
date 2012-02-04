# Maintainer: Ray Rashif <schivmeister@gmail.com>

pkgname=steinberg-vst
_zipname=vst_sdk2_3
_extraname=vstsdk2.3
pkgver=2.3
pkgrel=5
pkgdesc="Steinberg's VST SDK"
arch=('any')
url="http://www.steinberg.net/en/company/developer.html"
license=('custom')
source=($_zipname.zip
        $pkgname.profile)
md5sums=('c91d3be58ad4e9c695d0a90b2198be0d'
         '684e0e8c0561eba55b2f0fd236c2f67e')

build() {
  cd "$srcdir"

  # extract build archive
  bsdtar -x -f $_extraname.zip
  rm -f $_extraname.zip
  rm -f *.{dmg,sit}

  # install license
  cd $_extraname
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 *Licensing* "$pkgdir/usr/share/licenses/$pkgname/"

  # install headers
  cd source/common
  mkdir -p "$pkgdir/usr/include/vst"
  rm -rf CVS
  install -m644 * "$pkgdir/usr/include/vst/"

  # install startup profile
  install -Dm755 "$srcdir/$pkgname.profile" "$pkgdir/etc/profile.d/$pkgname.sh"
}

# vim:set ts=2 sw=2 et:
