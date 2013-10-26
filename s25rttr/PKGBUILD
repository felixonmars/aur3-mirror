#Maintainer: float <flo.at at gmx dot de>

pkgname=s25rttr
pkgver=0.8.1
build=8972
pkgrel=3
pkgdesc="Return to the Roots. A free clone of The Settlers II from 1996"
arch=('i686' 'x86_64')
url="http://www.siedler25.org/"
license=('GPL3')
depends=('sdl>=1.2.0' 'sdl_mixer>=1.2.0')
source=($pkgname.sh $pkgname.desktop $pkgname.xpm)
md5sums=('ccb9c1d1a579c6d8490589a84b068e90'
         '8c486f63efb1c9bec6d50306270f1b4c'
         'a7bf0908aac3dbfaed837c19695ca362')
         
if [[ $CARCH == 'i686' ]]; then
  source+=("http://www.siedler25.org/uploads/stable/$pkgver/${pkgname}_${pkgver}-${build}_linux.i386.tar.bz2")
  md5sums+=('780f65c53e46a049d19f721db8af176d')
elif [[ $CARCH == 'x86_64' ]]; then
  source+=("http://www.siedler25.org/uploads/stable/$pkgver/${pkgname}_${pkgver}-${build}_linux.x86_64.tar.bz2")
  md5sums+=('824653ec33df76ff4146cc8c8d9b6ed6')
fi

package() {
  install -d -m755 "$pkgdir"/usr/share/
  cp -ra "$srcdir"/"$pkgname"_"$pkgver"/share/* "$pkgdir"/usr/share/
  cp -ra "$srcdir"/"$pkgname"_"$pkgver"/lib/ "$pkgdir"/usr/share/"$pkgname"/
  find "$pkgdir"/usr/ -type d -exec chmod 755 "{}" \;
  find "$pkgdir"/usr/ -type f -exec chmod 644 "{}" \;
  
  install -Dm644 "$srcdir"/"$pkgname".xpm "$pkgdir"/usr/share/pixmaps/"$pkgname".xpm
  install -Dm644 "$srcdir"/"$pkgname".desktop "$pkgdir"/usr/share/applications/"$pkgname".desktop
  install -Dm755 "$srcdir"/"$pkgname".sh "$pkgdir"/usr/bin/"$pkgname"
  install -Dm755 "$srcdir"/"$pkgname"_"$pkgver"/bin/s25client "$pkgdir"/usr/bin/s25client

  return 0
}
