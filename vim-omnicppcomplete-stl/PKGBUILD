# Maintainer: Tianjiao Yin <ytj000@gmail.com>

pkgname="vim-omnicppcomplete-stl"
pkgdesc="std C++ (STL, streams, ...) tags for vim omnicppcomplete."
pkgver=0.9
pkgrel=2
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2358"
license=('unknown')
depends=('ctags')
source=('cpp_src.tar.bz2::http://www.vim.org/scripts/download_script.php?src_id=9178')
install=vim-omnicppcomplete-stl.install

build() {
  cd ${srcdir}
  rm cpp_src.tar.bz2

  # Make the source code more readable.
 #sed -i "s/\<_//g" cpp_src/*
 #sed -i "s/\<_//g" cpp_src/*
}

package() {
	mkdir -p ${pkgdir}/usr/share/
	cp ${srcdir} ${pkgdir}/usr/share/vim/ -r
}
md5sums=('61fa3157b7fa6bce021438ae53fa8c02')
