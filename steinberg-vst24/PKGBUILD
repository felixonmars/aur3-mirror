# Maintainer: Ray Rashif <schiv@archlinux.org>
# Contributor: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com

pkgname=steinberg-vst24
_zipname=vst_sdk2_4_rev2
pkgver=2.4r2
pkgrel=6
pkgdesc="Steinberg's VST SDK (version 2.4)"
arch=('any')
url="http://www.steinberg.net/en/company/developer.html"
license=('custom')
provides=('steinberg-vst')
source=(http://$_zipname.zip
        $pkgname.profile)
md5sums=('b4b496306a95e422ccffd0e73b87a870'
         '684e0e8c0561eba55b2f0fd236c2f67e')

package() {
  cd "$srcdir/vstsdk2.4"

  # install headers
  mkdir -p "$pkgdir/usr/include/vst24/pluginterfaces/vst2.x"
  install -m644 public.sdk/source/vst2.x/* "$pkgdir/usr/include/vst24/"
  install -m644 pluginterfaces/vst2.x/* \
    "$pkgdir/usr/include/vst24/pluginterfaces/vst2.x/"

  # install startup profile
  # don't do this because it's a makedep and may be removed
  #install -Dm755 "$srcdir/$pkgname.profile" "$pkgdir/etc/profile.d/$pkgname.sh"

  # install license
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 doc/*Licensing* "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
