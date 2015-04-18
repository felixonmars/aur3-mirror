# Maintainer: Borja Ruiz <borja [at] libcrack [dot] so>
_pkgname='binary-ninja'
_github_user='Vector35'
_github_name="binaryninja-python"
pkgname="${_pkgname}-git"
pkgver=r1.5179c33
pkgrel=1
pkgdesc='Binary Ninja is a set of tools to make the life of a vulnerability researcher easier.'
arch=(any)
url="https://github.com/${_github_user}/${_github_name}"
license=('BSD')
depends=('python2' 'python2-crypto' 'python2-pyside')
provides=("${_pkgname}")
groups=('devel')
source=("$_pkgname"::"git+https://github.com/${_github_user}/${_github_name}.git")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
  cd "${srcdir}/${_pkgname}"
  msg "placeholder..."
}

package() {
  cd "${pkgdir}"

  test -d "${pkgdir}/usr/bin" || mkdir -p "${_}"
  test -d "${pkgdir}/usr/share/${_pkgname}" || mkdir -p "${_}"

  install -Dm644 "${srcdir}/${_pkgname}/readme.md"  "${pkgdir}/usr/share/${_pkgname}/README"
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cp --no-preserve=ownership -a ${srcdir}/${_pkgname}/* "${pkgdir}/usr/share/${_pkgname}/"

  cat > "${pkgdir}/usr/bin/${_pkgname}" << EOF
#!/bin/sh
cd /usr/share/${_pkgname}
exec python2 binja.py \${@} &
EOF

  chmod +x "${pkgdir}/usr/bin/${_pkgname}"

}

# vim:set ts=2 sw=2 et:
