# Maintainer: Jonathan Liu <net147@gmail.com>
# Contributor: sLite (daniel@slite.org)
# Contributor: Paul Mattal <paul@archlinux.org>
# Contributor: Jason Chu <jason@archlinux.org>

pkgname=subversion16-opt
_pkgname=subversion
pkgver=1.6.17
pkgrel=1
pkgdesc="A Modern Concurrent Version Control System"
arch=('i686' 'x86_64')
license=('APACHE')
depends=('neon' 'apr-util' 'file')
optdepends=('libgnome-keyring' 'kdeutils-kwallet' \
            'python2: for some hook scripts' 'ruby: for some hook scripts')
makedepends=('krb5' 'apache' 'python2' 'autoconf' 'db' 'e2fsprogs' 'libgnome-keyring' 'kdelibs')
url="http://subversion.apache.org/"
options=('!makeflags' '!libtool')
source=(http://subversion.tigris.org/downloads/$_pkgname-$pkgver.tar.bz2{,.asc}
        svnserve.conf subversion.rpath.fix.patch
        kwallet.patch)
md5sums=('81e5dc5beee4b3fc025ac70c0b6caa14'
         '4db4fbb0b5315417da7c2447d3692fd8'
         'c459e299192552f61578f3438abf0664'
         '6b4340ba9d8845cd8497e013ae01be3f'
         '6e719869543065f1edeb253edc085b5f')

build() {
   cd "${srcdir}/${_pkgname}-${pkgver}"
   export PYTHON=/usr/bin/python2

   patch -Np0 -i ${srcdir}/subversion.rpath.fix.patch
   patch -Np1 -i ${srcdir}/kwallet.patch
   sed -i 's|/usr/bin/env python|/usr/bin/env python2|' tools/hook-scripts/{,mailer/{,tests/}}*.py

   ./configure --prefix=/opt/svn-1.6 --with-apr=/usr --with-apr-util=/usr \
               --with-zlib=/usr --with-neon=/usr --with-apxs \
               --with-sqlite=/usr --with-berkeley-db=:/usr/include/:/usr/lib:db-5.3 \
               --with-gnome-keyring --with-kwallet

   make
}

package() {
   cd "${srcdir}/${_pkgname}-${pkgver}"
   make DESTDIR="${pkgdir}" install
   install -d "${pkgdir}"/opt/svn-1.6/share/subversion
   cp -a tools/hook-scripts "${pkgdir}"/opt/svn-1.6/share/subversion/
   rm -f "${pkgdir}"/opt/svn-1.6/share/subversion/hook-scripts/*.in
   rm -rf "${pkgdir}"/usr
}
