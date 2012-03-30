# Maintainer: Ansgar Taflinski <ataflinski@uni-koblenz.de>

pkgname=syscp
pkgver=20120330
pkgrel=1
pkgdesc="A small, but powerful PHP-based server control panel. Runs with apache2 or lighttpd."
arch=(any)
url="http://www.syscp.org"
license=('GPL')
groups=
provides=
depends=('php' 'mysql')
#source=(http://files.syscp.org/releases/tgz/$pkgname-$pkgver.tar.gz)
md5sums=('be19d48c1a347b0911e3564dcdaa5631')
_gitroot=https://github.com/flol/SysCP.git
_gitname=SysCP.git

build(){
  cd $srcdir
  if [[ -d "$_gitname" ]]; then
    cd "$_gitname"
    git reset --hard && git clean -dxf
    git pull
  else
    git clone "$_gitroot" "$_gitname"
    cd "$_gitname"
  fi
}
package() {
  mkdir $pkgdir/srv
  mkdir $pkgdir/srv/http
  cp -r $srcdir/$_gitname/$pkgname $pkgdir/srv/http/SysCP
} 
