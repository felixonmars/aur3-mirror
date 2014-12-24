pkgname=julia-datastructures-git
pkgver=0.3.4.0.10.g553c7dd
pkgrel=1
pkgdesc="DataStructures.jl"
url="https://github.com/JuliaLang/DataStructures.jl"
arch=('i686' 'x86_64')
license=('LGPLv3')
# TODO version depends
depends=('julia')
makedepends=('cmake')
provides=('julia-datastructures')
options=('debug' 'strip')
source=(git://github.com/JuliaLang/DataStructures.jl)
md5sums=('SKIP')

pkgver() {
  cd DataStructures.jl

  git describe | sed -e 's/^[^0-9]*//' -e 's/-/.0./' -e 's/-/./g'
}

package() {
  cd DataStructures.jl

  install -dm755 "${pkgdir}/usr/share/licenses/$pkgname/"
  install License.md "${pkgdir}/usr/share/licenses/$pkgname/"

  site_dir=$(julia -f -e "print(((pre) -> filter(((x) -> x[1:length(pre)] == pre), sort(LOAD_PATH, lt=(x, y) -> length(x) < length(y)))[1])(ARGS[1]))" "/usr")

  install -dm755 "${pkgdir}/${site_dir}/DataStructures.jl"

  cp -a src "${pkgdir}/${site_dir}/DataStructures.jl"
}
