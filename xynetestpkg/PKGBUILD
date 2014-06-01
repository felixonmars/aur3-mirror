#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=xynetestpkg
pkgver=2013.9.19
pkgrel=2
pkgdesc='Temporary package for testing changes in python3-aur.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/powerpill"
depends=(python3 pyalpm 'pm2ml>2012.12.12' reflector aria2)
optdepends=('rsync: Rsync download support' 'python3-threaded_servers: internal Pacserve support')
backup=(etc/powerpill/powerpill.json)
source=(
  http://xyne.archlinux.ca/projects/powerpill/src/powerpill-2013.9.19.tar.xz
  http://xyne.archlinux.ca/projects/powerpill/src/powerpill-2013.9.19.tar.xz.sig
)
sha512sums=('4b0f8cd480c382ac268c18bad16d88579ea06cec0f75d27caabacd55576f6a6eba8cd3e2df31beac93f76ab9b2df269c4b81e8e9102768b5405db2dbd1e46c49'
            'SKIP')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "powerpill.json" "$pkgdir/etc/powerpill/powerpill.json"
  install -Dm644 "man/powerpill.json.1.gz" "$pkgdir/usr/share/man/man1/powerpill.json.1.gz"
  install -Dm644 "powerpill-bash-completion.sh" "$pkgdir/usr/share/bash-completion/completions/powerpill"
}

# vim: set ts=2 sw=2 et:
