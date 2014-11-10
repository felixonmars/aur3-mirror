# Maintainer: saneki <fake.saneki@gmail.com>
pkgname=disunity-git
_pkgname=disunity
pkgver=419.e8c4175
pkgrel=1
pkgdesc="An experimental toolset for Unity asset and asset bundle files."
arch=("any")
url="https://github.com/ata4/disunity"
license=("Unlicense")
makedepends=(git maven)
depends=(java-runtime)
source=("git://github.com/ata4/${_pkgname}.git" "launch.sh")
sha256sums=("SKIP" "b8125e9aa788a8093bde88d592d45e3a0f16c9f5f57444f769640ddd78eb1fff")

pkgver() {
  cd "${_pkgname}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  git submodule update --init --recursive
  ./maven-setup-submodules.sh
  mvn package
}

package() {
  cd "${_pkgname}/target"

  # Find .jar file: disunity-?.?.?-SNAPSHOT.jar
  _jar="$( ls -rt ./${_pkgname}-*.jar )"
  [ "$?" -ne "0" ] && return 1

  # Install .jar, lib/ directory, shell script
  install -Dm0644 "${_jar}" "${pkgdir}/opt/${pkgname}/${_pkgname}.jar"
  for f in lib/*.jar; do
    install -Dm0644 "${f}" "${pkgdir}/opt/${pkgname}/${f}"
  done
  # Use launch script for now
  #install -Dm0755 "../scripts/${_pkgname}.sh" "${pkgdir}/opt/${pkgname}/${_pkgname}.sh"
  install -Dm0755 "${srcdir}/launch.sh" "${pkgdir}/opt/${pkgname}/${_pkgname}.sh"

  # Symlink script
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
}
