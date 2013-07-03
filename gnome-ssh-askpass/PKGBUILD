# Contributor: Clément DÉMOULINS <clement@archivel.fr>
# Contributor: Mark Pustjens <pustjens@dds.nl>

pkgname=gnome-ssh-askpass
_pkgname=openssh
pkgver=6.2p2
pkgrel=1
pkgdesc='A GNOME and Gtk3 passphrase requesters for ssh-add.'
arch=(i686 x86_64)
url="http://www.openssh.org/portable.html"
license=('custom')
depends=('gtk3')
provides=('x11-ssh-askpass')
conflicts=('x11-ssh-askpass' 'ssh-askpass-fullscreen' 'gnome-ssh-askpass2')

source=(ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/$_pkgname-$pkgver.tar.gz
	0001-Ported-gnome-ssh-askpass2-to-gtk3.patch
        gnome-ssh-askpass.sh)
md5sums=('afe17eee7e98d3b8550cc349834a85d0'
         'ae36075c4c2c8d320ded7bd773d7367f'
         '48f09c13db808cfee20088e2a0481bd4')

build() {
  cd $srcdir/$_pkgname-$pkgver/contrib

  # patch submitted upstream
  patch -p2 -i $srcdir/0001-Ported-gnome-ssh-askpass2-to-gtk3.patch

  make gnome-ssh-askpass3
}

package() {
  cd $srcdir/$_pkgname-$pkgver/contrib
  install -D -m755 gnome-ssh-askpass3 $pkgdir/usr/lib/ssh/$pkgname

  install -d $pkgdir/etc/profile.d
  install -D -m755 $srcdir/gnome-ssh-askpass.sh $pkgdir/etc/profile.d/

  install -Dm644 $srcdir/$_pkgname-$pkgver/LICENCE $pkgdir/usr/share/licenses/$pkgname/LICENCE
}
md5sums=('be46174dcbb77ebb4ea88ef140685de1'
         'ae36075c4c2c8d320ded7bd773d7367f'
         '48f09c13db808cfee20088e2a0481bd4')
