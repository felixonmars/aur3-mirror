# Maintainer: Chuan Ji <ji@chu4n.com>

pkgname=jfbview
pkgver=0.5.1
pkgrel=1
pkgdesc="Fast framebuffer PDF and image viewer"
arch=('i686' 'x86_64')
url="http://seasonofcode.com/pages/jfbview.html"
license=('Apache')
depends=('mupdf>=1.7' 'imlib2' 'openjpeg2' 'jbig2dec')
makedepends=('git')

_gitroot="git://github.com/jichu4n/JFBView.git"
_gitname="jfbview"

build(){
  cd "${srcdir}"
  msg "Connecting to GIT server...."
  
  if [[ -d ${_gitname} ]]; then
    cd "${_gitname}"
    git checkout master
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
  git checkout $pkgver
  msg "Starting make..."
  make
}

package(){
  cd "${srcdir}/${_gitname}-build"
  install -Dm755 "./${_gitname}" "${pkgdir}/usr/bin/${_gitname}"
  install -Dm644 "./README" "$pkgdir/usr/share/doc/${_gitname}/README"
  cat "./${_gitname}.1" | gzip > "./${_gitname}.1.gz"
  install -Dm644 "./${_gitname}.1.gz" "$pkgdir/usr/share/man/man1/${_gitname}.1.gz"
}

# vim:set ts=2 sw=2 et:
