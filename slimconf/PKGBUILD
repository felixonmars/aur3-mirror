# Maintainer: TuxSpirit<tuxspiritATarchlinuxDOTfr>

pkgname=slimconf
_pkgname=SlimConf
pkgver=20120809
pkgrel=10
pkgdesc="Slim GUI Configure"
license=('GPL')
arch=('i686')
makedepends=('git')
depends=('slim' 'pygtk')
url="https://github.com/corenominal/SLiMconf"
source=("http://www.oytunozdemir.com/aur/slimconf/python2.patch")
md5sums=("2ecdf4b26ebf4368129542ee92c80527")

_gitroot="git://github.com/corenominal/SLiMconf.git"
_gitname="slimconf"

build() {   
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi
  
  cd $_gitname
  patch $pkgname < ../../python2.patch
  
  install -D -m755 $srcdir/$_gitname/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -D -m755 $srcdir/$_gitname/$pkgname-ui.glade "$pkgdir/usr/share/$pkgname/glade/$pkgname-ui.glade"

  
}  
