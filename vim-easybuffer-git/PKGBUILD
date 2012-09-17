# Maintainer: Fraterius <fraterius@gmail.com>

pkgname=vim-easybuffer-git
pkgver=20120917
pkgrel=1
pkgdesc='simple plugin to quickly switch between buffers using corresponding keys or buffer numbers displayed in easybuffer quick switch window'
arch=('any')
url="https://github.com/troydm/easybuffer.vim"
license=('custom')
depends=('vim')
groups=('vim-plugins')
install='vimdoc.install'
conflicts=('vim-easybuffer')
replaces=('vim-easybuffer')
provides=('vim-easybuffer')

# Cleaner _git format
_gitdomain='github.com'
_gituser='troydm'
_gitname='easybuffer.vim'
_gitroot="https://$_gitdomain/$_gituser/$_gitname.git"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server.... [$_gitdomain:$_gituser:$_gitname]"
  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone --depth=1 $_gitroot $_gitname
  fi
  msg "GIT checkout done or server timeout"
}

package() {
  install -d ${pkgdir}/usr/share/vim/vimfiles/{doc,plugin,syntax}

  install -D -m644 ${srcdir}/$_gitname/doc/* \
    ${pkgdir}/usr/share/vim/vimfiles/doc/

  install -D -m644 ${srcdir}/$_gitname/plugin/* \
    ${pkgdir}/usr/share/vim/vimfiles/plugin/

  install -D -m644 ${srcdir}/$_gitname/syntax/* \
    ${pkgdir}/usr/share/vim/vimfiles/syntax/
}

