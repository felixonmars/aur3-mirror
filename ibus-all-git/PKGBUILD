# Contributor: hubertstar<hubert at gmail.com>
pkgname=ibus-all-git
pkgver=20090220
pkgrel=1
pkgdesc="Next Generation Input Bus for Linux, include all modules."
arch=('i686' 'x86_64')
license=('LGPL')
url="http://ibus.googlecode.com"
depends=('dbus-python>=0.83.0' 'python>=2.5.0' 'pyxdg' 'iso-codes' 'librsvg' 'python-pysqlite' 'pyenchant' 'aspell-en' 'anthy' 'libhangul' 'libchewing' 'm17n-db' 'm17n-lib')
makedepends=('git' 'cvs' 'qt>=4.4.0')
conflicts=('ibus' 'ibus-pinyin' 'ibus-table' 'ibus-engine' 'ibus-git' 'ibus-pinyin-git' 'ibus-table-git' 'ibus-engine-git')
provides=('ibus' 'ibus-pinyin' 'ibus-table' 'ibus-engine' 'ibus-git' 'ibus-pinyin-git' 'ibus-table-git' 'ibus-engine-git')
install=ibus-all.install
source=()
md5sums=()

_git_ibus_name="ibus"
_git_ibus_root="git://github.com/phuang/ibus.git"

_git_pinyin_name="ibus-pinyin"
_git_pinyin_root="git://github.com/phuang/ibus-pinyin.git"

_git_table_name="ibus-table"
_git_table_root="git://github.com/acevery/ibus-table.git"


_git_m17n_name="ibus-m17n"
_git_m17n_root="git://github.com/phuang/ibus-m17n.git"

_git_anthy_name="ibus-anthy"
_git_anthy_root="git://github.com/phuang/ibus-anthy.git ibus-anthy"

_git_hangul_name="ibus-hangul"
_git_hangul_root="git://github.com/phuang/ibus-hangul.git"

_git_chewing_name="ibus-chewing"
_git_chewing_root="git://github.com/phuang/ibus-chewing.git"

build() {
    cd ${srcdir}
  
    msg "Connecting to ${_git_ibus_name} GIT server..."
    if [ -d ${srcdir}/${_git_ibus_name} ]; then
        cd ${_git_ibus_name} && git pull origin
        msg "The local files are updated."
    else
        git clone ${_git_ibus_root}
    fi

    msg "GIT checkout done or server timeout. Preparing sources..."

    rm -rf ${srcdir}/${_git_ibus_name}-build
    cp -r ${srcdir}/${_git_ibus_name} ${srcdir}/${_git_ibus_name}-build
    
    cd ${srcdir}
    
    msg "Connecting to ${_git_pinyin_name} GIT server..."
    if [ -d ${srcdir}/${_git_pinyin_name} ]; then
        cd ${_git_pinyin_name} && git pull origin
        msg "The local files are updated."
    else
        git clone ${_git_pinyin_root}
    fi

    msg "GIT checkout done or server timeout. Preparing sources..."

    rm -rf ${srcdir}/${_git_pinyin_name}-build
    cp -r ${srcdir}/${_git_pinyin_name} ${srcdir}/${_git_pinyin_name}-build
    
    cd ${srcdir}
    
    msg "Connecting to ${_git_table_name} GIT server..."
    if [ -d ${srcdir}/${_git_table_name} ]; then
        cd ${_git_table_name} && git pull origin
        msg "The local files are updated."
    else
        git clone ${_git_table_root}
    fi

    msg "GIT checkout done or server timeout. Preparing sources..."

    rm -rf ${srcdir}/${_git_table_name}-build
    cp -r ${srcdir}/${_git_table_name} ${srcdir}/${_git_table_name}-build
    
    cd ${srcdir}
    
    msg "Connecting to ${_git_m17n_name} GIT server..."
    if [ -d ${srcdir}/${_git_m17n_name} ]; then
        cd ${_git_m17n_name} && git pull origin
        msg "The local files are updated."
    else
        git clone ${_git_m17n_root}
    fi

    msg "GIT checkout done or server timeout. Preparing sources..."

    rm -rf ${srcdir}/${_git_m17n_name}-build
    cp -r ${srcdir}/${_git_m17n_name} ${srcdir}/${_git_m17n_name}-build
    
    cd ${srcdir}
    
    msg "Connecting to ${_git_anthy_name} GIT server..."
    if [ -d ${srcdir}/${_git_anthy_name} ]; then
        cd ${_git_anthy_name} && git pull origin
        msg "The local files are updated."
    else
        git clone ${_git_anthy_root}
    fi

    msg "GIT checkout done or server timeout. Preparing sources..."

    rm -rf ${srcdir}/${_git_anthy_name}-build
    cp -r ${srcdir}/${_git_anthy_name} ${srcdir}/${_git_anthy_name}-build
    
    cd ${srcdir}
    
    msg "Connecting to ${_git_hangul_name} GIT server..."
    if [ -d ${srcdir}/${_git_hangul_name} ]; then
        cd ${_git_hangul_name} && git pull origin
        msg "The local files are updated."
    else
        git clone ${_git_hangul_root}
    fi

    msg "GIT checkout done or server timeout. Preparing sources..."

    rm -rf ${srcdir}/${_git_hangul_name}-build
    cp -r ${srcdir}/${_git_hangul_name} ${srcdir}/${_git_hangul_name}-build
    
    cd ${srcdir}
        
    msg "Connecting to ${_git_chewing_name} GIT server..."
    if [ -d ${srcdir}/${_git_chewing_name} ]; then
        cd ${_git_chewing_name} && git pull origin
        msg "The local files are updated."
    else
        git clone ${_git_chewing_root}
    fi

    msg "GIT checkout done or server timeout. Preparing sources..."

    rm -rf ${srcdir}/${_git_chewing_name}-build
    cp -r ${srcdir}/${_git_chewing_name} ${srcdir}/${_git_chewing_name}-build
    
    cd ${srcdir}
    
    msg "Starting make..."
    
    cd ${srcdir}/${_git_ibus_name}-build
    ./autogen.sh --prefix=/usr \
                 --enable-pygconf
    
    make || return 1
    make DESTDIR=${pkgdir} install || return 1
    
    cd ${srcdir}/${_git_ibus_name}-build
    
    ####第一次构建的时候，必须先注释掉这些
    cd ${srcdir}/${_git_pinyin_name}-build
    
    ./autogen.sh --prefix=/usr
    make || return 1
    make NO_INDEX=true DESTDIR=${pkgdir} install || return 1
    
    cd ${srcdir}/${_git_table_name}-build
    
    ./autogen.sh --prefix=/usr \
               --enable-zhengma \
           --enable-wubi86 \
           --enable-wubi98 \
           --enable-cangjie5 \
           --enable-erbi-qs \
           --enable-additional
    make || return 1
    make DESTDIR="$pkgdir/" install
    
    cd ${srcdir}/${_git_table_extraphrase_name}-build
    ./autogen.sh --break-configure
    ./configure --prefix=/usr --libexecdir=/usr/lib/ibus
    make || return 1
    make DESTDIR="$pkgdir/" install

    
    cd ${srcdir}/${_git_m17n_name}-build
    
    ./autogen.sh --prefix=/usr
    make || return 1
    make DESTDIR="$pkgdir/" install
    
    cd ${srcdir}/${_git_anthy_name}-build
    
    ./autogen.sh --prefix=/usr
    make || return 1
    make DESTDIR="$pkgdir/" install
    
    cd ${srcdir}/${_git_hangul_name}-build
    
    ./autogen.sh --prefix=/usr
    make || return 1
    make DESTDIR="$pkgdir/" install
    
    cd ${srcdir}/${_git_chewing_name}-build
    
    ./autogen.sh --prefix=/usr
    make || return 1
    make DESTDIR="$pkgdir/" install  
      
    ###############################
    
    rm -rf ${srcdir}/ibus-*-build
}

