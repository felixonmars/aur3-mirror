#Contributor: Andrea Scarpino <bash.lnx@gmail.co>

pkgname=black-white-icon-theme
pkgver=0.4
pkgrel=1
pkgdesc="A nice theme icon"
url="http://dbgthekafu.deviantart.com/art/black-white-icon-thema-70416981"
license=('GPL')
arch=('i686' 'x86_64')
source=(http://fc06.deviantart.com/fs24/f/2007/347/1/0/black_white_icon_thema_by_DBGtheKafu.tar)
md5sums=('484e082596a84d480b90ba1d1294b62d')

build() {
  cd $startdir/src/black-white$pkgver
  tar -xf black-white.tar.gz

  mkdir -p $startdir/pkg/usr/share/icons/
  cp -r black-white $startdir/pkg/usr/share/icons/
  chmod -R 777 $startdir/pkg/usr/share/icons/black-white
  chown -R root:users $startdir/pkg/usr/share/icons/black-white
}
