# Maintainer: Tianjiao Yin <ytj000@gmail.com>

pkgname=vim-plugins-doc-zh
pkgver=20120209
pkgrel=1
pkgdesc="This package contains multiple Chinese vim plugin documents translated by vimcn and others."
url="https://github.com/vimcn"
license=('unknown')
arch=('any')
makedepends=('git')
install=vimdoc.install
source=("doclist")
md5sums=('e2c2dd7c3802c3ede78148defd1d027a')
depends=('vim')

build() {
  cd ${srcdir}
  cat doclist | xargs -n 1 git clone --depth 1

  # change vimpress' suffix name.
  cp ${srcdir}/vimpress/doc/vimpress.txt ${srcdir}/vimpress/doc/vimpress.cnx

}

package() {
  mkdir -p ${pkgdir}/usr/share/vim/vimfiles/doc
  cd ${srcdir}
  find -type f -name *.cnx | xargs cp -t ${pkgdir}/usr/share/vim/vimfiles/doc

  # Help files must use latin1 or utf-8 encoding. Vim assumes the encoding is
  # utf-8 when finding non-ASCII characters in the first line. Thus you must
  # translate the header with "For Vim version".
  #
  # 很多帮助文件都无视了这条规则，因此我只能用如下丑陋的解决方案。
  #
  cd ${pkgdir}
  find -type f -name "*.cnx" -print0 | xargs -n 1 -0 \
    /usr/bin/vim --noplugins -n -u NONE -e -s -c "normal ggA ·" -c "wq"

}

# vim:set ts=2 sw=2 et:
