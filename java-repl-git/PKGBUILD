# Maintainer: B.C. van Duuren <bcvanduuren@gmail.com>

_pkgname="java-repl"
pkgname="java-repl-git"
pkgver="20141003"
pkgrel="1"
pkgdesc="Java REPL is a simple Read-Eval-Print-Loop for Java language"
arch=("any")
url="https://github.com/albertlatacz/${_pkgname}"
license=("Apache")
depends=("java-environment" "bash")
makedepends=("apache-ant" "git")
source=("git+${url}.git")

package() {
    cd ${_pkgname}
    ant
    install -Dm 0744 build/artifacts/javarepl-dev.build.jar ${pkgdir}/usr/lib/${_pkgname}/${_pkgname}.jar
    mkdir -p ${pkgdir}/usr/bin/
    cat > ${srcdir}/${_pkgname}.sh <<EOF
#!/bin/sh

java -jar /usr/lib/${_pkgname}/${_pkgname}.jar
EOF
    install -Dm 0755 ${srcdir}/${_pkgname}.sh ${pkgdir}/usr/bin/${_pkgname}
}

md5sums=("SKIP")
