# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=finesharp
pkgname=vapoursynth-plugin-${_plug}
pkgver=r3
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('i686' 'x86_64')
url="http://forum.doom9.org/showthread.php?t=166524"
license=('GPL')
depends=('vapoursynth')
makedepend=('git')
source=("${_plug}::git+https://gist.github.com/8676fd350d4b5b223ab9.git")
sha1sums=('SKIP')
_sites_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "${_plug}"
  printf "r%s" "$(git rev-list --count HEAD)"
}

package() {
  install -Dm644 "${_plug}/${_plug}.py" "${pkgdir}${_sites_packages}/${_plug}.py"
}
