# Contributor: Cooper Hubbell <cooper814 at gmail dot com>

pkgname=hpt-cli
_realname=CLI-Linux
pkgver=3.5
pkgrel=100701
pkgdesc="CLI for HighPoint RocketRaid 3xxx/4xxx RAID Controllers"
arch=('x86_64')
url="http://www.highpoint-tech.com"
license=('custom')
makedepends=('rpmextract')
provides=('hpt-cli')
conflicts=('hpt-cli')
install=hpt-cli.install
source=(http://www.highpoint-tech.cn/BIOS_Driver/GUI/linux/CLL/$_realname-$pkgver-$pkgrel.tgz
	hptsvr)
md5sums=('3bebb9a4902e65ca3b374e716a6d8c0e'
         '8d45a636ac278572c10c8e3af64b1800')
build() 
{
mkdir -p "$pkgdir"/etc/rc.d/
mkdir -p "$pkgdir"/usr/bin
mkdir -p "$pkgdir"/usr/share/doc/hpt/hptraidconf-$pkgver/
mkdir -p "$pkgdir"/usr/share/man/man1/
mkdir -p "$pkgdir"/usr/share/hpt/hptsvr-3.13.7/

cd "$srcdir"/"$_realname-$pkgver-$pkgrel"/rpm/
rpmextract.sh "$srcdir"/"$_realname-$pkgver-$pkgrel"/rpm/hptraidconf-"$pkgver"-1."$arch".rpm
rpmextract.sh "$srcdir"/"$_realname-$pkgver-$pkgrel"/rpm/hptsvr-3.13-7."$arch".rpm

install -m 755 "$srcdir"/"$_realname-$pkgver-$pkgrel"/rpm/usr/bin/* "$pkgdir"/usr/bin
install -m 755 "$srcdir"/"$_realname-$pkgver-$pkgrel"/rpm/usr/share/hpt/hptsvr-3.13.7/* "$pkgdir"/usr/share/hpt/hptsvr-3.13.7
install -m 755 "$srcdir"/"$_realname-$pkgver-$pkgrel"/rpm/usr/share/doc/hpt/hptraidconf-"$pkgver"/* "$pkgdir"/usr/share/doc/hpt/hptraidconf-"$pkgver"
install -m 755 "$srcdir"/$_realname-$pkgver-$pkgrel/rpm/usr/share/man/man1/* "$pkgdir"/usr/share/man/man1
install -m 755 "$srcdir"/hptsvr "$pkgdir"/etc/rc.d/
}
