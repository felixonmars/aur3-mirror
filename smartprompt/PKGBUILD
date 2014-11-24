# Maintainer: Fernando Oliveira <fernando@fholiveira.com>

pkgname=smartprompt
pkgver=v1.1
pkgrel=1
pkgdesc="A customizable prompt generator for your terminal emulator"
arch=('x86_64' 'i686')
_pkgpath=github.com/fholiveira
_pkgfullname=${_pkgpath}/${pkgname}
url="https://${_pkgfullname}"
source=("$pkgname-$pkgver::git+https://${_pkgfullname}.git") #tag=v${pkgver}")
md5sums=('SKIP')
license=('MIT')
depends=('bash')
makedepends=('go' 'cmake' 'python' 'libssh2')

prepare() {
  cd "${srcdir}"
  mkdir -p "src/${_pkgpath}"
  mv "${pkgname}-${pkgver}" "src/${_pkgfullname}"
}

build() {
  export GOPATH="${srcdir}"
  cd "${srcdir}/src/${_pkgfullname}"

  make install
  go install
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  install -p -m755 "${srcdir}/bin/"* "${pkgdir}/usr/bin"

  mkdir -p "${pkgdir}/${GOPATH}"
  cp -Rv --preserve=timestamps "${srcdir}/"{src,pkg} "${pkgdir}/${GOPATH}"

  # Package license (if available)
  for f in LICENSE COPYING LICENSE.* COPYING.*; do
    if [ -e "${srcdir}/src/${_pkgfullname}/$f" ]; then
      install -Dm644 "${srcdir}/src/${_pkgfullname}/$f" \
        "${pkgdir}/usr/share/licenses/${pkgname}/$f"
    fi
  done
}

post_install() {
  cat <<EOS
  ==> WARNING! You will need to add the following line to the end of your
  ==> ~/.bashrc:

  ==> export PROMPT_COMMAND='export PS1="$(smartprompt)"'

  ==> For more details please visit https://gihub.com/fholiveira/smartprompt
EOS
}

post_upgrade() {
  post_install $1
}

# vim:set ts=2 sw=2 et:
