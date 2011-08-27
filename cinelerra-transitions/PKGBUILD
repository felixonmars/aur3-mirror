pkgname=cinelerra-transitions
pkgver=2.1
pkgrel=1
pkgdesc="Transitions for cinelerra mostly from akirad and OpenShot."
arch=("any")
url="http://arch.tm3da.eu"
license=('GPL')
groups=(cinelerra)
depends=(cinelerra-cv)
source=("http://tmp.tm3da.eu/repo/cinelerra-transitions.tar.xz")
md5sums=('056e26d8156d8b74404e340130712cd5')

build() {
  cd "$srcdir/usr/lib/cinelerra/"
  mkdir shapes
  cd shapes
  for i in $(ls ../shapes.in/); do 
    ln -s "../shapes.in/$i" "$i";
  done;

  mkdir ../shapewipe
  cd ../shapewipe
  for i in $(ls ../shapes.in/); do 
    ln -s "../shapes.in/$i" "$i";
  done;

  cd "$srcdir"
  cp -r usr/ "$pkgdir"
} 
