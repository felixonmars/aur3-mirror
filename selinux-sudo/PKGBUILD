# $Id: PKGBUILD 188591 2013-06-16 17:14:27Z foutrelis $
# Maintainer: Nicky726 <Nicky726@gmail.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=selinux-sudo
_origname=sudo
_sudover=1.8.7
#pkgver=${_sudover/p/.p}
pkgver=1.8.7
pkgrel=1
pkgdesc="Give certain users the ability to run some commands as root with SELinux support"
arch=('i686' 'x86_64')
url="http://www.sudo.ws/sudo/"
license=('custom')
groups=('selinux' 'selinux-system-utilities')
depends=('glibc' 'selinux-pam' 'selinux-usr-libselinux')
conflicts=("${_origname}")
provides=("${_origname}=${pkgver}-${pkgrel}")
backup=('etc/sudoers' 'etc/pam.d/sudo')
options=('!libtool')
source=(http://www.sudo.ws/sudo/dist/$_origname-$_sudover.tar.gz{,.sig}
        sudo.pam)
sha256sums=('39626cf3d48c4fd5a9139a2627d42bfefac7ce47f470bdba3aeb4e3d7c49566a'
            'SKIP'
            'e7de79d2c73f2b32b20a8e797e54777a2bf19788ec03e48decd6c15cd93718ae')

build() {
  cd "$srcdir/$_origname-$_sudover"

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    --with-logfac=auth \
    --with-pam \
    --with-env-editor \
    --with-passprompt="[sudo] password for %p: " \
    --with-all-insults \
    --with-selinux
  make
}

check() {
  cd "$srcdir/$_origname-$_sudover"
  make check
}

package() {
  cd "$srcdir/$_origname-$_sudover"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/sudo.pam" "$pkgdir/etc/pam.d/sudo"

  install -Dm644 doc/LICENSE "$pkgdir/usr/share/licenses/sudo/LICENSE"
}

# vim:set ts=2 sw=2 et:
