# Maintainer: Florian Hahn <flo@fhahn.com>

pkgname=boogie-hg
pkgdesc='Boogie is an Intermediate Verification Language (IVL) for describing proof obligations to be discharged by a reasoning engine, typically an SMT solver'
license=('custom: Ms-Pl')
pkgver=r4017.02815f46a6f1
pkgrel=1
depends=('z3-bin' 'mono')
makedepends=('mercurial')
conflicts=('boogie')
provides=('boogie')
arch=('any')
url=('http://boogie.codeplex.com')
source=("$pkgname"::'hg+https://hg.codeplex.com/boogie'
        execute_boogie.sh
        license.txt)
md5sums=('SKIP'
         '3c484f49455c24eb8984461b9d78d45f'
         'ab2e2e62d9befcc932895745749d4a54')


pkgver() {
  cd "$pkgname"
    printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
    cd "${srcdir}/${pkgname}/Source"
    xbuild Boogie.sln
}

package() {
    install -Dm755 execute_boogie.sh "${pkgdir}/usr/bin/boogie"
    install -Dm644 license.txt "${pkgdir}/usr/share/licenses/boogie/LICENSE"
    cd "${srcdir}/${pkgname}/Binaries"

    # install dll and exe files
    for dll in $(ls *.dll *.exe)
    do
        install -Dm644 "$dll" "${pkgdir}/usr/lib/boogie/$dll"
    done
    ln -s /usr/bin/z3 "${pkgdir}/usr/lib/boogie/z3.exe"
}
