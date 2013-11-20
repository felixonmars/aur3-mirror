# Contributor: Philip Müller <philm_at_manjaro_dot_org>

pkgname=xfce4-theme-numix-manjaro-themes
_upsname=numix-manjaro-themes.git
pkgver=20131116
_ver='8a017eb24e16c9d6f51430ef283f39fccca1c1e6'
pkgrel=1
pkgdesc="Desktop suite for Xfce"
arch=('any')
url="http://git.manjaro.org/artwork/numix-manjaro-themes"
license=('GPL3')
depends=('gtk-engine-murrine')
makedepends=('git')
provides=("numix-manjaro-themes")
conflict=("numix-manjaro-themes")
optdepends=('faenza-green-icon-theme: matching icon theme')

source=("$pkgname-$pkgver.tar.gz::http://git.manjaro.org/artwork/numix-manjaro-themes/repository/archive?ref=$_ver")
sha256sums=('49ff36fc81352908d13767c3ad77b9788174288e33e037297879c46d013a48bc')

package() {
  if [ -e "$srcdir/core-$pkgname" ]; then
	   cd "$srcdir/core-$pkgname"
  fi
  if [ -e "$srcdir/$pkgname" ]; then
     cd "$srcdir/$pkgname"
  fi
  if [ -e "$srcdir/$pkgname.git" ]; then
	   cd "$srcdir/$pkgname.git"
  fi

  # create theme dirs
  install -d -m 755 "$pkgdir"/usr/share/themes

  # install theme
  cp -r "$srcdir"/"$_upsname"/* "$pkgdir"/usr/share/themes

  # clean up
  rm -rf "$pkgdir"/usr/share/themes/{.git,.gitignore,"$pkgname"-"$pkgver".tar.gz}
}

# vim:set ts=2 sw=2 et:
