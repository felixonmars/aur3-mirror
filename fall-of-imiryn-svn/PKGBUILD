# Maintainer: Iwan Gabovitch <qubodup@gmail.com>

pkgname=fall-of-imiryn-svn
_pkgname=fallofimiryn
pkgver=940
pkgrel=2
pkgdesc="A classic role-playing style game of three aspiring young warriors."
arch=('i686' 'x86_64')
url="http://annchienta.sf.net/?page=fall_of_imiryn"
depends=('python' 'annchienta-svn')
makedepends=('subversion')
license=('GPL')
provides=('fall_of_imiryn')
source=('fallofimiryn'
        'fallofimiryn.png'
        'fallofimiryn.desktop')
md5sums=('6c02fe55824dbb6597883f826c6b868d'
         '127f573a46cdfa8ff9312703827aa3a2'
         '3ee6e1efda7c8b45a82bca3455a28979')

_svntrunk=https://annchienta.svn.sourceforge.net/svnroot/annchienta/trunk/Annchienta/fall_of_imiryn
_svnmod=fall_of_imiryn

build() {

  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn export $_svntrunk --config-dir ./ -r $pkgver
  fi

  msg "SVN export done or server timeout"

  # Create pkgdir folders
  install -d "$pkgdir/usr/bin/"
  install -d $pkgdir/usr/share/{applications,games/fallofimiryn,icons}

  # Install files
  cd "$_svnmod"

  # game folder
  cp * -r "$pkgdir/usr/share/games/$_pkgname/"

  # executable/icon/.desktop
  cd "$srcdir"
  install -Dm755 fallofimiryn "$pkgdir/usr/bin/"
  install -Dm644 fallofimiryn.png "$pkgdir/usr/share/icons/"
  install -Dm644 fallofimiryn.desktop "$pkgdir/usr/share/applications"
}
