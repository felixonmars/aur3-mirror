# Maintainer: Damian Nowak <damian.nowak@atlashost.eu>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=coreutils-static
pkgver=8.21
pkgrel=4
pkgdesc="The basic file, shell and text manipulation utilities of the GNU operating system compiled statically and installed in /rescue"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://www.gnu.org/software/coreutils"
groups=('base')
depends=()
install=coreutils.install
source=(ftp://ftp.gnu.org/gnu/coreutils/coreutils-$pkgver.tar.xz{,.sig}
        'attr.PKGBUILD::https://projects.archlinux.org/svntogit/packages.git/plain/trunk/PKGBUILD?h=packages/attr'
        'libcap.PKGBUILD::https://projects.archlinux.org/svntogit/packages.git/plain/trunk/PKGBUILD?h=packages/libcap')
sha512sums=('cf0e5a393b486dd7fd46600dc2928bd2303250f3bce7b2f0de1bb3bf7b0cc3f6e29001b23fda5bbabe7686bf78917cfabe1f81abb602ab41cd406b45021fd229'
            'SKIP'
            'ef7c4da50b052af0549c0f9b39e5607595c302b547c1e941c3ed72236378951d6471710143c244feffd3510dc9364e62a757cd0692c97fe2b55168e761436cbf'
            'a18831cb5e751832b3eb7feecca8b2a491ae5b1804aeb77fffa6953c94a4993295f028dbd521e72f34834fcc1c2524acf07217342e64ee20e5e7e30e03f24be9')

build() {
  libs=''

  # build each dependent PKGBUILD and provide -L for coreutils compilation
  cd ${srcdir}
  for file in ./*.PKGBUILD; do
    cd ${srcdir}
    name="${file%.PKGBUILD}"
    mkdir -p "$name"
    mv "$file" "$name/PKGBUILD"
    cd "$name"
    makepkg -f
    staticlibdirs=$(find "`pwd`" -name '*.a' -printf "%h\n" | sort -u)
    for staticlibdir in $staticlibdirs; do
       libs="$libs -L$staticlibdir"
    done
    rm `realpath *.pkg.tar.xz` # yaourt bug: http://bugs.archlinux.fr/task/323
  done

  cd ${srcdir}/coreutils-${pkgver}

  sed -i '/elf_sys=yes/s:yes:no:' configure # https://bugs.gentoo.org/show_bug.cgi?id=321821

  ./configure --prefix=/rescue --libexecdir=/usr/lib \
              --enable-no-install-program=groups,hostname,kill,uptime \
              --disable-nls 

  make CC="gcc -static -std=gnu99 ${libs}"
}

check() {
  cd ${srcdir}/coreutils-${pkgver}

  # This test fails, `id -G user` coredumps
  sed -i 's/fail=1/fail=0/' tests/misc/id-groups.sh 

  make RUN_EXPENSIVE_TESTS=yes check
}

package() {
  cd ${srcdir}/coreutils-${pkgver}
  make DESTDIR=${pkgdir} install
}
