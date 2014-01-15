# Maitainer: wenLiangcan <boxeed@gmail.com>

pkgname=gibo
pkgver=1.0.2
pkgrel=1
pkgdesc="A shell script for easily accessing gitignore boilerplates"
arch=('any')
url="https://github.com/simonwhitaker/gibo"
license=('Unlicense')
depends=('curl' 'git' 'sh')
source=("https://github.com/simonwhitaker/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('5aa6dc1e30cc23f59f27ec11b4e025e3')
install="${pkgname}.install"

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    folder="${pkgdir}/etc/${pkgname}"
    mkdir -p "${folder}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "gibo-completion.bash" "${folder}/gibo-completion.bash"
    install -Dm644 "gibo-completion.zsh" "${folder}/gibo-completion.zsh"
}
