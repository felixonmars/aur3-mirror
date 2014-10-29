# Maintainer: Evan Roman <evrom@outlook.com>
# Based on ufw-bzr by graysky

pkgname=ufw-python3
_pkgname=ufw
pkgver=0.33
pkgrel=1
pkgdesc="Uncomplicated and easy to use CLI tool for managing a netfilter firewall. Python 3 intall"
arch=('any')
url="https://launchpad.net/ufw"
license=('GPL3')
depends=('iptables' 'python')
makedepends=('')
provides=('ufw')
conflicts=('ufw')
backup=('etc/ufw/before.rules'
'etc/ufw/before6.rules'
'etc/ufw/after.rules'
'etc/ufw/after6.rules'
'etc/ufw/ufw.conf'
'etc/ufw/user.rules'
'etc/ufw/sysctl.conf'
'etc/default/ufw'
'usr/lib/ufw/user.rules'
'usr/lib/ufw/user6.rules')
source=("https://launchpad.net/ufw/$pkgver/$pkgver/+download/ufw-$pkgver.tar.gz"
"$_pkgname.service")
sha256sums=('5f85a8084ad3539b547bec097286948233188c971f498890316dec170bdd1da8'
'fdface6f4690e4748fbbd5661c02e1967a8750fdb23581d35516174017a3fe39')

prepare() {
  cd "$_pkgname-$pkgver"

	# FS#28769 - move from /lib to /usr/lib
  sed -e 's|/lib|/usr/lib|' -i setup.py
}

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir
	
# FS#35458 - correct iptables location
  {
  sed -e 's|sbin|bin|g' -i $pkgdir/usr/lib/python3.4/site-packages/ufw/*
  } || {
  echo "omitting __pycache__ file"
  }
	install -Dm644 $srcdir/$_pkgname.service $pkgdir/usr/lib/systemd/system/$_pkgname.service
  chmod 644 $pkgdir/etc/ufw/*.rules $pkgdir/usr/lib/ufw/*.rules
  
	install -Dm755 $pkgdir/usr/sbin/$_pkgname $pkgdir/usr/bin/$_pkgname
	rm -rf $pkgdir/usr/sbin
}
