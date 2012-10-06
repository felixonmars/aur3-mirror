# Maintainer: scippio <scippio@berounet.cz>
# Contributor: scippio <scippio@berounet.cz>

pkgname=vim-taglisttoo
pkgver=20121006
pkgrel=1
pkgdesc="TaglistToo is very similar to the very popular taglist.vim written by Yegappan Lakshmanan, but with a focus on being extensible and customizable."
url="https://github.com/ervandew/taglisttoo"
license=('unknow')
arch=('any')
depends=('vim')

_gitroot="git://github.com/ervandew/taglisttoo.git"
_gitname="taglisttoo"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d $_gitname ]] ; then
    ( cd $_gitname && git pull origin; )
    msg "The local files are updated."
  else
    git clone "$_gitroot"
    msg "Checkout ..."
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."
}

package() {
  
  cd "${srcdir}/${_gitname}"
  
  for i in autoload plugin
  do
    install -dm 755 "${pkgdir}/usr/share/vim/vimfiles/$i"
  done

  cp -r ${srcdir}/${_gitname}/autoload ${pkgdir}/usr/share/vim/vimfiles
  cp -r ${srcdir}/${_gitname}/plugin ${pkgdir}/usr/share/vim/vimfiles
}