# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Szymon Chachulski szym-at-mit-dot-edu
pkgname=openafs-features
pkgver=1.7.17
pkgrel=1
pkgdesc="Open source implementation of AFS, modular packaging of Features release"
arch=('i686' 'x86_64')
url="http://www.openafs.org/"
license=('custom')
depends=('krb5')
provides=('openafs')
conflicts=('openafs')
backup=('etc/openafs/CellServDB'
        'etc/openafs/ThisCell'
        'etc/openafs/afs.conf'
        'etc/openafs/cacheinfo')
install=openafs.install
source=(http://www.openafs.org/dl/openafs/$pkgver/openafs-$pkgver-src.tar.bz2 \
        fix-includes.patch
        cacheinfo openafs.rc)
md5sums=('dd5e17aa5e2b682c533867cf24abf0e4'
         '6380361b889776e0617dc0c54277412e'
         'a0617306a76c7f3fd7a42135d9ff6d85'
         'b08e64f44501b97f449c8a38e22ab761')

build() {
  cd "$srcdir/openafs-$pkgver"

  # Fix missing include of sys/resources.h
  # This solves the error "‘PRIO_PROCESS’ undeclared"
  patch -Np1 < ${srcdir}/fix-includes.patch || true

  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/openafs \
    --with-linux-kernel-packaging --with-afs-sysname=i386_linux26 \
    --disable-fuse-client # breaks build
  make all_nolibafs
}

package() {
  cd "$srcdir/openafs-$pkgver"

  make DESTDIR="$pkgdir/" install_nolibafs

  # rename binaries already provided by heimdal
  mv "$pkgdir"/usr/bin/kpasswd "$pkgdir"/usr/bin/kpasswd-openafs

  # move pam modules to place where they belong
  install -d -m755 "$pkgdir"/usr/lib/security
  mv "$pkgdir"/usr/lib/pam_* "$pkgdir"/usr/lib/security/

  # install rc script
  install -D -m755 "$srcdir"/openafs.rc "$pkgdir"/etc/rc.d/openafs

  # create configs
  install -D -m644 src/afsd/CellServDB "$pkgdir"/etc/openafs/CellServDB
  install -D -m644 src/packaging/RedHat/openafs-ThisCell "$pkgdir"/etc/openafs/ThisCell
  install -D -m644 src/afsd/afs.conf.linux "$pkgdir"/etc/openafs/afs.conf
  install -D -m644 "$srcdir"/cacheinfo "$pkgdir"/etc/openafs/cacheinfo

  # create cachedir directories
  mkdir -p "$pkgdir"/var/cache/openafs
  chmod 700 "$pkgdir"/var/cache/openafs

  # install license
  install -D -m644 src/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
