# Maintainer: Auguste Pop <auguste [at] gmail [dot] com>

# If you want to force a specific optdepend,
# simply add it to the makedepends array.
# That's all.

pkgname=osdlyrics
pkgver=0.4.3
pkgrel=1
pkgdesc="A lyric show compatible with various media players"
arch=('i686' 'x86_64')
url="http://code.google.com/p/osd-lyrics/"
license=('GPL3')
depends=('gtk2' 'dbus-glib' 'curl' 'libnotify' 'sqlite3'
         'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('intltool')
optdepends=('libmpd: MPD support'
            'xmms2:   XMMS2 support')
install=$pkgname.install
source=(http://osd-lyrics.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('a14a3fbfe07eb7137074126db63b9aa2')

_ods=()
_tmpfile="$pkgdir/.tmp"

add_ods()
{
    pkg-config $1 && echo "$3" >> "$_tmpfile" || _ods=("${_ods[@]}" "$2")
}

unset_optdepend()
{
    for _idx in ${!optdepends[@]}
    do
        if [[ "${optdepends[$_idx]}" =~ ^$1:* ]]
        then
            unset optdepends[$_idx]
            break
        fi
    done
}

build()
{
    cd "$srcdir/$pkgname-$pkgver"

    aclocal
    autoheader
    autoconf
    automake --add-missing

    rm -rf "$_tmpfile"
    add_ods libmpd "--disable-mpd" libmpd
    add_ods xmms2-client "--disable-xmms2" xmms2

    LIBS=-lm ./configure --prefix=/usr "${_ods[@]}"
    make
}

package()
{
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install

    while read _ch
    do
        if [[ 1 -gt 0 ]]; then depends=("${depends[@]}" "$_ch"); fi
        unset_optdepend "$_ch"
    done < "$_tmpfile"
    optdepends=("${optdepends[@]}")
    rm -rf "$_tmpfile"
}
