#Maintainer: exul <exul  [at] v-net [dot] ch>

pkgname=vim-sparkup
pkgver=20141121
pkgrel=1
pkgdesc="A python utility that expands condensed HTML into full code."
arch=('i686' 'x86_64')
url=https://github.com/rstacruz/sparkup
license=('MIT')
depends=('python2' 'vim')
makedepends=('git')
md5sums=('SKIP')

_gitroot=https://github.com/rstacruz/sparkup.git

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d ${pkgname} ] ; then
    cd ${pkgname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${pkgname}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."
}

package() {
    mkdir -p ${pkgdir}/usr/share/vim/vimfiles/ftplugin/html
    install -Dm644 ${srcdir}/${pkgname}/vim/ftplugin/html/sparkup.vim ${pkgdir}/usr/share/vim/vimfiles/ftplugin/html/
    install -Dm755 ${srcdir}/${pkgname}/sparkup.py ${pkgdir}/usr/share/vim/vimfiles/
    install -Dm755 ${srcdir}/${pkgname}/mit-license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt

    cp -Pr ${srcdir}/${pkgname}/vim/ftplugin/{htmldjango,smarty,xml} ${pkgdir}/usr/share/vim/vimfiles/ftplugin/
    cp -Pr ${srcdir}/${pkgname}/vim/ftplugin/html/sparkup.py ${pkgdir}/usr/share/vim/vimfiles/ftplugin/html/
}
