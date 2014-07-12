
# Custom properties used in PKGBUILD and auto-package creation.
_filename_exp=zk-v[#.#.#.#].sdz
_force_update=n
_category='games'

pkgname=spring-zk-highest_rated_maps
pkgver=1
pkgrel=1
pkgdesc="A futuristic, multiplatform, open-source, Zero-K is a treat on the Spring Engine. Highest rated maps from http://zero-k.info/Maps"
arch=(any)
url="http://zero-k.info/"
license=('GPL')
depends=("spring-zk")
source=("http://api.springfiles.com/files/maps/deltasiegerevx.sd7"
  "http://api.springfiles.com/files/maps/nightscape_v2.sd7"
  "http://api.springfiles.com/files/maps/astroturf_v1.sd7"
  "http://api.springfiles.com/files/maps/trojan_hills_v02.sd7"
  "http://api.springfiles.com/files/maps/westernfrontierv2.sd7"
  "http://api.springfiles.com/files/maps/supreme_battlefield_dry.sd7"
  "http://api.springfiles.com/files/maps/heartbreaker_v2.sd7"
  "http://api.springfiles.com/files/maps/centre-command.sd7"
  "http://api.springfiles.com/files/maps/violence_3.2.sd7"
  "http://api.springfiles.com/files/maps/aum_1.0.sd7"
)
noextract=("nightscape_v2.sd7"
        "deltasiegerevx.sd7"
        "astroturf_v1.sd7"
        "trojan_hills_v02.sd7"
        "westernfrontierv2.sd7"
        "supreme_battlefield_dry.sd7"
        "heartbreaker_v2.sd7"
        "centre-command.sd7"
        "violence_3.2.sd7"
        "aum_1.0.sd7")

package() {
    mkdir -p ${pkgdir}/usr/share/spring/games/zero-k-maps
    install -Dm644 ${srcdir}/* ${pkgdir}/usr/share/spring/games/zero-k-maps
}

# vim:set ts=2 sw=2 et:
md5sums=('a1af87d39bfe45f4a3d131d4df762f89'
         'f1ab53535e215f5b53460ac262df69ac'
         'a7068578c9e9c1ff2a81a6f873faebba'
         'b0a01944b05132b3f4a94c542f2a2259'
         '4bf41a3b4cc0368c8e7b52957fab3b2d'
         '680e260384bd44f33726cadd2fe6ee17'
         '2132c2b610ddf81a4cbf70323e3fdc2e'
         '91aa1d040f44f30d4e1c7f4e3a866427'
         '383bb07904a716cab42c17ce83131bd9'
         '267d87bfed866c50a40dc80a3c67baf6')
