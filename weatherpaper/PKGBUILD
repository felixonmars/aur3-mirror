# Maintainer: Dominik Mayer <dominik.mayer@gmail.com>
pkgname=weatherpaper
pkgver=0.2.2
pkgrel=1
pkgdesc="A weather based desktop wallpaper changer"
arch=('any')
url="http://code.google.com/p/weatherpaper/"
license=('GPL')
depends=('python' 'python-imaging')
source=(http://weatherpaper.googlecode.com/files/$pkgver-linux.tar.gz)
md5sums=('bf52f1960f60387beab73ffc0fbdd562')

build() {

  mkdir "$pkgdir/opt"
  #mkdir "$pkgdir/opt/WeatherPaper"
  mkdir "$pkgdir/usr"
  mkdir "$pkgdir/usr/share"
  mkdir "$pkgdir/usr/share/applications"

  cd "$srcdir/$pkgver-linux"
  chmod a-x "weatherpaper.desktop"
  chmod a-x "weatherpaper-editor.desktop"
  mv "weatherpaper.desktop" "$pkgdir/usr/share/applications/weatherpaper.desktop"
  mv "weatherpaper-editor.desktop" "$pkgdir/usr/share/applications/weatherpaper-editor.desktop"
  rm "install.sh"

  mv "$srcdir/$pkgver-linux" "$pkgdir/opt/WeatherPaper"

}
