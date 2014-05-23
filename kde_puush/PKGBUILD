# Maintainer: Pecto
pkgname=kde_puush
pkgver=20140522
pkgrel=1
pkgdesc="bash wrapper for puush and KDE"
url="https://github.com/Pectojin/KDE_puush"
license=("MIT")
arch=('any')
makedepends=('git')
depends=('grep' 'sed' 'bash' 'curl' 'pacman' 'scrot' 'kdebase-kdialog')
optdepends=()
source=('git+https://github.com/Pectojin/KDE_puush.git')
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

package() {
  echo "Enter Puush API key ( Can be found under http://puush.me/account/settings )"
  read api_key
  install -Dm755 "$srcdir/KDE_puush/KDE_puush" "$pkgdir/usr/bin/KDE_puush"
  sed -i s/PUUSH_API_KEY=\"\"/PUUSH_API_KEY=\"$api_key\"/g $pkgdir/usr/bin/KDE_puush
  wget -O $pkgdir/usr/bin/puush.png https://www.dropbox.com/s/0v72x9f50irja1w/puush.png
  }
