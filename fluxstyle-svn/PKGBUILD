# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: Zerial <fernando@zerial.org>

pkgname=fluxstyle-svn
pkgver=59
pkgrel=3
pkgdesc="A graphical style/theme manager for the fluxbox windows manager."
arch=('i686' 'x86_64')
url="http://fluxstyle.berlios.de/"
license=('GPL')
depends=('python')
provides=('fluxstyle')
md5sums=()

_svntrunk="svn://svn.berlios.de/fluxstyle/trunk"
_svnmod="fluxstyle"

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  sed -i "29,29 s|#GLADEFILE="/usr/share/fluxstyle/glade/main.glade"|GLADEFILE="/usr/share/fluxstyle/glade/main.glade|" fluxStyle
  sed -i "31,31 s|GLADEFILE="./glade/main.glade"|#GLADEFILE="./glade/main.glade"|" fluxStyle
  sed -i "51,51 s|images|glade|" setup.py

  patch fluxStyle $startdir/fluxstyle-svn-gladefix.patch

  python setup.py install --root=$startdir/pkg
  rm  -rf  $startdir/src/$_svnmod-build
}
