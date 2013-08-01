pkgname=blender-script-bakery-git
pkgver=281
pkgrel=1
pkgdesc="A collection of scripts written by members of CG Cookie to improve their Blender workflow."
arch=(any)
license=("GPLv2, donationware")
depends=("blender>=9:2.68")
makedepends=(python git)
options=(!emptydirs)
url="https://github.com/CGCookie/script-bakery"
source=("${pkgname%-*}::git+https://github.com/CGCookie/script-bakery.git")
md5sums=('SKIP')

pkgver () {
  cd "$srcdir/${pkgname%-*}"
  echo $(git rev-list --count master)
}

package() {
  cd "${srcdir}/${pkgname%-*}"
  rm -r scripts/tests
  rm -r scripts/addons/test-prefs
  find . -name '.DS_Store' -o -name '*.blend1' -o -name '*.blend2' -o -name 'Thumbs.db' |
    xargs -rtl1 rm
  mkdir -p "$pkgdir/usr/share/blender/2.68"
  cp -r scripts "$pkgdir/usr/share/blender/2.68/"
  python -m compileall "$pkgdir/usr/share/blender"
}
