# Maintainer: apkawa <apkawa@gmail.com>
pkgname=vim-zencoding-git
pkgver=20110510
pkgrel=1
pkgdesc="vim plugins for HTML and CSS hi-speed coding"
arch=(any)
url="http://github.com/mattn/zencoding-vim"
license=('custom')
depends=(vim)
groups=('vim-plugins')
conflicts=('vim-zencoding')

_gitroot="https://github.com/mattn/zencoding-vim.git"
_gitname="${pkgname}"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."
    install -d ${pkgdir}/usr/share/vim/vimfiles/{plugin,autoload}
    install ${srcdir}/${pkgname}/plugin/zencoding.vim ${pkgdir}/usr/share/vim/vimfiles/plugin/
    install ${srcdir}/${pkgname}/autoload/zencoding.vim ${pkgdir}/usr/share/vim/vimfiles/autoload/

}

