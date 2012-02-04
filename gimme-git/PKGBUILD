# Maintainer: Konrad Scorciapino <konr@konr.mobi>
pkgname=gimme-git
pkgrel=1
pkgver=20110825
pkgdesc="An XMMS2 client for GNU Emacs."
arch=(any)
url="http://www.gimmeplayer.org"
license=('GPL')
conflicts=('gimme')
provides=('gimme')
groups=('Emacs' 'xmms2')
depends=('xmms2' 'emacs' 'ruby' 'emacs-color-theme' 'ruby-glib2')
makedepends=('git' 'rubygems')

_gitroot="http://github.com/konr/GIMME.git"
_gitname="GIMME"

build() {
  ## GIMME 
    msg "Cloning GIMME..."
    git clone "$_gitroot" "$_gitname" --depth=1
  ## Packages
    msg "Installing Gems..."
    cd $_gitname
    sh install-gems.sh
}

package() {
    mkdir $pkgdir/opt
    mv $srcdir/$_gitname $pkgdir/opt
    
}

