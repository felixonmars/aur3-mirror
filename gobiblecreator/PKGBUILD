# Maintainer: hauzer <alokinpwn@gmail.com>
pkgname=gobiblecreator
_pkgname=GoBibleCreator
pkgver=2.4.1
pkgrel=1
pkgdesc="Go Bible creation software."
arch=('any')
url="http://www.crosswire.org/gobible/"
license=('GPL')
depends=('java-runtime')
makedepends=('unzip')
_pkgfile="${_pkgname}_Version_${pkgver}.zip"
source=("${_pkgfile}::http://dl.box.net/dl/656161759/7cfc797906b406abe08d272b376c057e?a=1281e81785029476a2cf3147ec5cab9b&m=10.12.30.52,11211&x=1&c=0c022a2484631b24e3ebc3d92d7f7b3a")
noextract=("${_pkgfile}")
md5sums=('b25b69b99aba0fc7a651cadbfc9c3d9f')

build() {
  unzip "${srcdir}/${_pkgfile}" -d "${srcdir}/${pkgname}-${pkgver}"
}

package() {
  cat > "${srcdir}/${pkgname}" <<EOF
#!/bin/bash
"\$JAVA_HOME/bin/java" -jar '/opt/${pkgname}/${_pkgname}.jar' "\$@"
EOF

  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/${pkgname}-${pkgver}/"* "${pkgdir}/opt/${pkgname}/"
  install -D -m 755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  chmod 755 "${pkgdir}/opt/${pkgname}/${_pkgname}.jar"
}

