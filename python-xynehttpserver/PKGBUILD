#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python-xynehttpserver
pkgver=2011.06.23.20387
pkgrel=19
pkgdesc='Python BaseHTTPServer classes extended with authentication, SSL, and threading.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python-xynehttpserver"
depends=(python2)
source=(
  http://xyne.archlinux.ca/projects/python-xynehttpserver/archives/python-xynehttpserver-2011.06.23.20387.tar.xz
  http://xyne.archlinux.ca/projects/python-xynehttpserver/archives/python-xynehttpserver-2011.06.23.20387.tar.xz.sig
)
sha512sums=(
  f539d0877e696d6813feeb4b717b17059bf5e5363f4ac874afe0df5302e7408ef8e0331e3991949000b20916f20b1035dee514803b96238925feb60c13e2f5b6
  d0c7688165a18aeb79c587fc730cb729912f2965de0ec56fadff1bbc22d27fef0acd0db68b260fcae5b38d8cab3fa50fdaa933f09365739319a90429cac2d469
)
md5sums=(
  2594a6ae472c2cf1ed7022f0042b4713
  df1703b7d4aab7eb77f5a6643e24cbdb
)

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir"/ --optimize=1
}


# vim: set ts=2 sw=2 et:
