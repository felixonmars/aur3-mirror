# Maintainer: jsteel <mail at jsteel dot org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: Tobias Kieslich <tobias_justdreams.de>

pkgname=muttng
pkgver=1.5.18
pkgrel=1
pkgdesc="A small but very powerful text-based mail client (well featured fork)"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gpgme' 'gdbm')
makedepends=('gnupg' 'subversion' 'quilt' 'git')
url="http://mutt-ng.berlios.de/"
conflicts=('mutt')
provides=('mutt')
options=('!makeflags')
source=(ftp://ftp.mutt.org/mutt/devel/mutt-${pkgver}.tar.gz
         mutt_ImapCrashes.patch::"http://dev.mutt.org/trac/changeset/bba92e401440?format=diff&new=5401:bba92e401440")
md5sums=('27c30037120189b9f9c0d3e76361b8f8'
         '86b7780410f787dc66ce8e6f7622eecc')

build() {
  msg "Getting sources..."

  if [[ -d muttng-patchset ]] ; then
    cd muttng-patchset && git pull origin
    msg "The local files are updated." && cd ../
  else
    git clone https://github.com/codito/muttng-patchset.git muttng-patchset
  fi

  cd ${srcdir}/mutt-$pkgver

  ln -s ../muttng-patchset/patches patches

  #Thanks for the fix Tobias!
  sed -i "s/(expanded), cmd,/(expanded), 0, cmd,/" patches/debian.compressed.diff

  PATCH_GET="0"
  quilt push -a
  patch -p0 < ${srcdir}/mutt_ImapCrashes.patch

  ./prepare --prefix=/usr --sysconfdir=/etc \
    --enable-pop --enable-smtp --enable-imap --enable-pgp --enable-compressed \
    --enable-nntp --with-regex --with-ssl=/usr --enable-gpgme --with-gpgme-prefix=/usr \
    --enable-hcache --without-idn --with-sasl

  make
}

package() {
  cd "$srcdir"/mutt-$pkgver
  make DESTDIR=${pkgdir} install
  rm -rf ${pkgdir}/etc/mime.types
}

# vim:set ts=2 sw=2 et:
