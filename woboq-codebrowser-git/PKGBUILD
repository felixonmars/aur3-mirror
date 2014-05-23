pkgname=woboq-codebrowser-git
pkgver=20140522
pkgrel=1
pkgdesc='Woboq code browser generator (git)'
arch=('i686' 'x86_64')
url='http://woboq.com/codebrowser.html'
license=('Creative Commons')
depends=('clang>=3.3' 'cmake')
makedepends=('git')

_gitroot='git://github.com/woboq/woboq_codebrowser.git'
_gitname='woboq_codebrowser'

build(){
  cd "${srcdir}"
  msg "Connecting to GIT server...."
  
  if [[ -d ${_gitname} ]]; then
    cd "${_gitname}"
    git pull origin
    msg "The local files are updated."
  else
    git clone "${_gitroot}" "${_gitname}"
    cd "${_gitname}"
  fi
  msg "Checkout done or server timeout"
  rm -rf "${srcdir}/${_gitname}-build"
  git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"

  cd "${srcdir}/${_gitname}-build"
  msg "Starting make..."
  cmake . \
      -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
      -DCMAKE_BUILD_TYPE=Release
  make
}

package(){
  cd "${srcdir}/${_gitname}-build"
  install -Dm755 'indexgenerator/codebrowser_indexgenerator' \
      "${pkgdir}/usr/bin/codebrowser_indexgenerator"
  install -Dm755 'generator/codebrowser_generator' \
      "${pkgdir}/usr/bin/codebrowser_generator"
  install -Dm755 'scripts/fake_compiler.sh' \
      "${pkgdir}/usr/bin/fake_compiler.sh"
  install -Dm644 README "$pkgdir/usr/share/doc/${_gitname}/README"
  install -dm755 "${pkgdir}/usr/share/${_gitname}"
  cp -r data "${pkgdir}/usr/share/${_gitname}/data"
}

# vim:set ts=2 sw=2 et:
