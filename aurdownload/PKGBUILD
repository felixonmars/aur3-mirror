#Maintainer: nixalot <nixalot at nixalot dot com>
pkgname=aurdownload
pkgver=1.1
pkgrel=1
pkgdesc='Retrieve and extract PKGBUILDS from the AUR'
arch=(any)
license=(GPL3)
url="https://github.com/nixalot/$pkgname"
depends=('python' 'python-requests')
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/nixalot/aurdownload/archive/1.1.tar.gz
)

md5sums=('728f4bfe91227e6c6080b04ad30912d7')
sha1sums=('5d4590c19e0734f8cd100973dc082b51e2e1203e')
sha256sums=('e3a635ef744daaf6a60ed980879a04846bd8fffa2b0532ff77979f18805855e9')
sha384sums=('08dd438a27d3ebf514396103b0737b79a641d7ca4e81acb8fc1e3f6f1a237cc4b0ae7a50617a40aa771e7c8ac058c16a')
sha512sums=('ecbf1b5381b365bccb0ae42d53f1b3cfdf0e897d3ec4ee313a283597ae084dd9f6083ede11557e10db35359bf4971c96c104562802f4ef53dda3f8cd01001389')

package ()
{
  install -D -m755 "$srcdir/$pkgname-$pkgver/${pkgname}.py" "$pkgdir/usr/bin/$pkgname"
}

# vim: set ts=2 sw=2 et:
