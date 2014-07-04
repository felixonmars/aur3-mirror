# Maintainer: Chris Wuest <chris@chriswuest.com>
pkgname=lfetool-git
pkgver=20140703
pkgrel=1
pkgdesc="An Erlang Lisper's tool for Admin Tasks, Project Creation and Infrastructure"
url="https://github.com/lfe/lfetool"
arch=('any')
license=('Apache')
depends=('erlang-nox')
makedepends=('git')
provides=('lfetool')
source=()
md5sums=()

_gitroot="https://github.com/lfe/lfetool.git"
_src_files_dir="lfetool"

prepare() {
  cd "$srcdir"
  msg "Connecting to GIT server..."

  if [[ -d "$_src_files_dir" ]]; then
    cd "$_src_files_dir" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_src_files_dir"
  fi

  msg "GIT checkout done or server timeout"
}

package() {
  install -d "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgdir}/usr/bin"
  cp "${srcdir}/${_src_files_dir}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"

  "${srcdir}/${_src_files_dir}"/lfetool install lfetool "${pkgdir}/usr/bin/"
  "${pkgdir}"/usr/bin/lfetool extract
}
