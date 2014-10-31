# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=lgso-git
_gitname=LGSO
pkgver=1.21_2_gbe77ccf
pkgrel=1
pkgdesc="A utility to gather save games into a single sane location (git)"
arch=(any)
url="https://github.com/Tux1c/LGSO"
license=('GPL2')
depends=('bash')
makedepends=('git')
conflicts=('lgso')
source=("git+https://github.com/Tux1c/LGSO.git")
md5sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --tags | sed -e 's:^v::' -e 's:-:_:g'
}

package() {
  cd "$srcdir/$_gitname"

  install -Dm755 lgso.sh "$pkgdir/usr/bin/lgso.sh"
  ln -s lgso.sh "$pkgdir/usr/bin/lgso"
}
