
pkgname=quicksharegeneric
name=quickshareGeneric
pkgver=0.2
pkgrel=1
pkgdesc='Easy to use, Free and Open-Source Multimedia converter for Linux in Python'
arch=(any)
license=(GPL)
url=("https://opendesktop.org/content/show.php/Curlew?content=155664")
depends=('python>=2.7')
conflicts=()
source=(http://www.croesus.co.za/daniel/$name-$pkgver.tar.gz)
md5sums=("3a1bbc8b0696bffd8315a4c8d71f5cbc")
#install="$pkgname.install"

package()
{
  cd "$srcdir/$name"
  mkdir -p ${pkgdir}/usr/share/quickshare/icons
  mkdir -p ${pkgdir}/usr/share/applications
  cp ./*.py ${pkgdir}/usr/share/quickshare/
  cp ./icons/*.png ${pkgdir}/usr/share/quickshare/icons/
  sed -i "s|/usr/|python2 /usr/|" quickshare
  sed -i "1s|python|python2|" run.py
  install -D -m755 "quickshare" "$pkgdir/usr/bin/quickshare"
  install -p -m644 "quickshare.desktop" "${pkgdir}/usr/share/applications/"
}


# vim: set ts=2 sw=2 et:
