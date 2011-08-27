# Contributor: Tim Diels <limyreth[at]gmail.com>
pkgname=vim-indent-python
pkgver='0.3'
pkgrel=1
pkgdesc="vim indent script for python code"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=974"
license=('unknown')
groups=()
depends=(vim)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('http://www.vim.org/scripts/download_script.php?src_id=4316')
noextract=()
md5sums=('9ba17880533f890000d46bd20bbc8782')

build() {
  cd ${srcdir}

  install --verbose -m 644 -D 'download_script.php?src_id=4316' \
    ${pkgdir}/usr/share/vim/vimfiles/indent/python.vim || return 1
}

# vim:set ts=2 sw=2 et:
