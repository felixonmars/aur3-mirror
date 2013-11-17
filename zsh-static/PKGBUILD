# Maintainer: Damian Nowak <damian.nowak@atlashost.eu>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=zsh-static
pkgver=5.0.2
pkgrel=1
pkgdesc='A very advanced and programmable command interpreter (shell) for UNIX (compiled statically and installed in /rescue)'
arch=('i686' 'x86_64')
url='http://www.zsh.org/'
license=('custom')
depends=('pcre' 'libcap' 'gdbm')
install=zsh.install
source=("zsh::http://optimate.dl.sourceforge.net/project/zsh/zsh/${pkgver}/zsh-${pkgver}.tar.bz2"
        'gdbm.PKGBUILD::https://projects.archlinux.org/svntogit/packages.git/plain/trunk/PKGBUILD?h=packages/gdbm'
        'gdbm-1.10-zeroheaders.patch::https://projects.archlinux.org/svntogit/packages.git/plain/trunk/gdbm-1.10-zeroheaders.patch?h=packages/gdbm'
        'pcre.PKGBUILD::https://projects.archlinux.org/svntogit/packages.git/plain/trunk/PKGBUILD?h=packages/pcre'
        'libcap.PKGBUILD::https://projects.archlinux.org/svntogit/packages.git/plain/trunk/PKGBUILD?h=packages/libcap'
        'ncurses.PKGBUILD::https://projects.archlinux.org/svntogit/packages.git/plain/trunk/PKGBUILD?h=packages/ncurses'
        "glibc.svn::svn://svn.archlinux.org/packages/glibc/repos/core-$CARCH")
sha512sums=('096e9fee085bbcb88035984c28cc9d186ae549f9ab09d699f380438b82fcf09b03ac2e9635ddb3cef9d0f287403c10fd29d21ec18f79e8bfab63760db738a07d'
            '88f11515e551d3c22bd1f515c62b7b1c8ef75a987faca78e05db14f78d4bd0d04592535bf977ab9fa63a5a254d6c0944b02b3a7b225f5071ba0331a92a3e24e8'
            '48e41ba3b3b3d6b1c0a0931324fe6341fddbaa1de64aaf8dcdda8adba447e3d72fa8c9e9aff9c6701cc13c6dc57287567aa992e78d5f398d38eb656564137974'
            '6aa1e65e4149bc0e55af5f7eae3497242b20494da786fc4adbfbf1a50498c684d0bba1bf7e5484eabd420987020c32d8d43010e79a360303890ceab68998853c'
            'a18831cb5e751832b3eb7feecca8b2a491ae5b1804aeb77fffa6953c94a4993295f028dbd521e72f34834fcc1c2524acf07217342e64ee20e5e7e30e03f24be9'
            '5f627014066f51b531f810c6805bd0f414d5aba70d81af3420eeeb3a73bd8a23cd38026553728eebc490af3c14e5e4acc2b99a899cefb7c99ed14e7a19468564'
            'SKIP')

prepare() {
  cd "${srcdir}/zsh-${pkgver}"

  # Set correct keymap path
  sed -i 's#/usr/share/keymaps#/usr/share/kbd/keymaps#g' Completion/Unix/Command/_loadkeys

  # Remove unneeded and conflicting completion scripts
  for _fpath in AIX BSD Cygwin Darwin Debian Mandriva openSUSE Redhat Solaris; do
    rm -rf Completion/$_fpath
    sed "s#\s*Completion/$_fpath/\*/\*##g" -i Src/Zle/complete.mdd
  done
  rm -f  Completion/Linux/Command/_{pkgtool,rpmbuild,yast}
  rm -f  Completion/Unix/Command/_{osc,systemd}
}

build() {
  # build each dependent PKGBUILD and provide -L for package compilation
  libs=''

  cd ${srcdir}
  for file in ./*.svn; do
    cd ${srcdir}/$file
    sed -i 's/install=/#install=/' PKGBUILD
    sed -i 's/check()/check_disabled()/' PKGBUILD
    makepkg -f
    staticlibdirs=$(find "`pwd`" -name '*.a' -printf "%h\n" | sort -u)
    for staticlibdir in $staticlibdirs; do
       libs="$libs -L$staticlibdir"
    done
    rm `realpath *.pkg.tar.xz` # yaourt bug: http://bugs.archlinux.fr/task/323
  done || msg2 'No extra SVN checkouts, skipping'

  cd ${srcdir}
  for file in ./*.PKGBUILD; do
    cd ${srcdir}
    name="${file%.PKGBUILD}"
    mkdir -p "$name"
    mv "$file" "$name/PKGBUILD"
    cp "$name"-* "$name" || msg2 'No extra files for dependent PKGBUILD, skipping'
    cd "$name"
    sed -i 's/install=/#install=/' PKGBUILD
    sed -i 's/check()/check_disabled()/' PKGBUILD
    makepkg -f
    staticlibdirs=$(find "`pwd`" -name '*.a' -printf "%h\n" | sort -u)
    for staticlibdir in $staticlibdirs; do
       libs="$libs -L$staticlibdir"
    done
    rm `realpath *.pkg.tar.xz` # yaourt bug: http://bugs.archlinux.fr/task/323
  done || msg2 'No extra PKGBUIDs, skipping'

  cd "${srcdir}/zsh-${pkgver}"
  ./configure --prefix=/rescue \
    --enable-etcdir=/etc/zsh \
    --enable-zshenv=/etc/zsh/zshenv \
    --enable-zlogin=/etc/zsh/zlogin \
    --enable-zlogout=/etc/zsh/zlogout \
    --enable-zprofile=/etc/zsh/zprofile \
    --enable-zshrc=/etc/zsh/zshrc \
    --enable-maildir-support \
    --with-term-lib='ncursesw' \
    --enable-multibyte \
    --enable-function-subdirs \
    --enable-fndir=/rescue/share/zsh/functions \
    --enable-scriptdir=/rescue/share/zsh/scripts \
    --with-tcsetpgrp \
    --enable-pcre \
    --enable-cap \
    --enable-zsh-secure-free \
    --disable-dynamic    
  make CC="gcc -static ${libs}"
}

check() {
  cd "${srcdir}/zsh-${pkgver}"
  HOME="${srcdir}" make check
}

package() {
  cd "${srcdir}/zsh-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
