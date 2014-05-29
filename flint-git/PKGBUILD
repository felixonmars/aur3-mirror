# Maintainer: Joel Teichroeb <joel@teichroeb.net>

pkgname=flint-git
pkgver=r20.0ffd8d8
pkgrel=1
pkgdesc="Facebook's C++ linter"
arch=('i686' 'x86_64')
url="https://github.com/facebook/flint.git"
license=('Apache')
makedepends=('git' 'ldc' 'libgphobos-devel')
source=('git://github.com/facebook/flint.git')
md5sums=('SKIP')

pkgver() {
	cd flint
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd flint
	ldc2 -of=fflint Main.d Ignored.d Checks.d Tokenizer.d FileCategories.d
}

check() {
	cd flint
	ldc2 -of=unittest Test.d Checks.d Tokenizer.d FileCategories.d
	./unittest
}

package() {
	install -D -m 0755 "${srcdir}/flint/fflint" "${pkgdir}/usr/bin/fflint"
}

