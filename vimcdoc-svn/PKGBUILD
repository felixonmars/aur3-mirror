# Contributor:  tocer deng <tocer.deng@gmail.com>

pkgname=vimcdoc-svn
pkgver=HEAD
pkgrel=1
pkgdesc="the vim Chinese document"
url="http://vimcdoc.sf.net"
arch=('i686' 'x86_64')
license=('custom')
depends=('vim-runtime')
source=()
_svntrunk=https://vimcdoc.svn.sourceforge.net/svnroot/vimcdoc/trunk
_svnmod=vimcdoc
install=vimcdoc.install
md5sums=()

build() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."
}

package() {

  vimcdocpath=${pkgdir}/usr/share/vim/vimfiles/doc/
  mkdir -p ${vimcdocpath}
  for i in ${srcdir}/$_svnmod/doc/*.txt; do
    install -m 644 $i ${vimcdocpath}
  done
  rename .txt .cnx ${vimcdocpath}/*.txt

  vimsyntaxpath=${pkgdir}/usr/share/vim/vimfiles/syntax
  mkdir -p ${vimsyntaxpath}
  install -m 644 ${srcdir}/$_svnmod/help_cn.vim ${vimsyntaxpath}

  docpath=${pkgdir}/usr/share/doc/vimcdoc
  mkdir -p ${docpath}
  install -m 644 ${srcdir}/$_svnmod/{README,AUTHORS} ${docpath}

  licensepath=${pkgdir}/usr/share/licenses/vimcdoc
  mkdir -p ${licensepath}
  install -m 644 ${srcdir}/$_svnmod/LICENSE ${licensepath}
}
# vim:syntax=sh
