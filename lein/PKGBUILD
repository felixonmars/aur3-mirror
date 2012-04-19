# Maintainer: pisuka <tekmon@gmail.com>
pkgname=lein
pkgver=1.7.1
pkgrel=1
pkgdesc="Leiningen is for automating Clojure projects without setting your hair on fire."
arch=(any)
url="https://github.com/technomancy/leiningen"
license=(EPL)
groups=()
depends=(java-runtime-headless)
makedepends=()
optdepends=("rlwrap: for better REPL")
provides=(leiningen)
conflicts=(leiningen leiningen2-git)
replaces=()
backup=()
options=()
install=
source=(https://raw.github.com/technomancy/leiningen/${pkgver}/bin/lein
		https://raw.github.com/technomancy/leiningen/${pkgver}/bash_completion.bash)
md5sums=(6cc30ee732c7037ba9d83428f3138b61 3936bfbe82c47587df6baef8c4f087d8)

package() {
	mkdir -p "${pkgdir}"/usr/bin/ "${pkgdir}"/usr/share/bash-completion/completions/
	install -m 755 -D "${srcdir}"/lein "${pkgdir}"/usr/bin/lein
	install -D "${srcdir}"/bash_completion.bash "${pkgdir}"/usr/share/bash-completion/completions/lein
}

# vim:set ts=2 sw=2 et:
