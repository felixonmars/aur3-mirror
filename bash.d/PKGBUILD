# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=bash.d
pkgver=1381473521
pkgrel=1
pkgdesc="Subscripts for GNU Bash shells"
url="https://github.com/GNU-Pony/bash.d"
arch=(any)
license=(GPL3)
depends=(bash coreutils)
optdepends=("libnotify: for alert.bash"
	    "sed: for palette.bash"
	    "git: for git branch in prompt.bash"
	    "acpi: for battery status in prompt.bash")
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(34d9011fff8ac8841804b72019d6ca7be22bfda8545c120ac2f20049fcf13900)

_prefix=/usr


package() {
	cd "${srcdir}/bash.d-${pkgver}"
	mkdir -p -- "${pkgdir}${_prefix}/share/bash.d"
	mkdir -p -- "${pkgdir}${_prefix}/share/doc/${pkgname}"
	install -Dm644 src/*.bash -- "${pkgdir}${_prefix}/share/bash.d"
	install -Dm644 README     -- "${pkgdir}${_prefix}/share/doc/${pkgname}"
	_dir="${pkgdir}${_prefix}/share/licenses/${pkgname}"
	mkdir -p -- "${_dir}"
	ln -sf -- "/usr/share/licenses/common/GPL3" "${_dir}/LICENSE"
	install -m644 -- COPYING "${_dir}/COPYING"
}

