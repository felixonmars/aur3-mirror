# Contributor: Osily <ly50247{at}gmail{dot}com>

pkgname=cvim
_realname=vim
_srcver=7.3
pkgver=${_srcver}
pkgrel=1
pkgdesc="Vim compiled without gui, without deps on vi/vim, ruby and desktop utils, supports x clipboard."
arch=(i686 x86_64)
license=('custom:vim')
url="http://www.vim.org"
depends=('libxt' 'gtk2')
makedepends=('wget' 'sed' 'grep' 'python2' 'perl' 'gzip')
provides=(${_realname})
conflicts=(gvim vim)
source=(ftp://ftp.vim.org/pub/vim/unix/vim-${_srcver}.tar.bz2)
md5sums=('5b9510a17074e2b37d8bb38ae09edbf2')

build() {
cd ${srcdir}/vim$(echo ${_srcver} | sed "s/\.//")
wget ftp://ftp.vim.org/pub/vim/patches/7.3/7.3.*
for x in `ls 7.3.*`; do patch -p0 -i $x; done

#python2
sed -i -e 's|vi_cv_path_python, python|vi_cv_path_python, python2|' \
	    ${srcdir}/vim73/src/configure.in
(cd ${srcdir}/vim73/src && autoconf)

./configure --prefix=/usr --localstatedir=/var/lib/vim --mandir=/usr/share/man \
    --with-features=big  --disable-gui \
    --with-x=auto --disable-gpm \
    --with-global-runtime=/usr/share/vim \
    --enable-multibyte --enable-cscope \
    --enable-perlinterp --enable-pythoninterp
make || return 1

make  VIMRCLOC=/etc DESTDIR=${pkgdir} install

cd ${pkgdir}/usr/bin
rm -f ex view rview xxd vimtutor
find ${pkgdir}/usr/share/man -type d -name 'man1' 2>/dev/null | \
    while read _mandir; do
    cd ${_mandir}
    rm -f ex.1 view.1 vimtutor.1 xxd.1
done

# fix FS#17216
sed -i 's|messages,/var|messages,/var/log/messages.log,/var|' \
    ${pkgdir}/usr/share/vim/vim$(echo ${_srcver} | sed "s/\.//")/filetype.vim

sed -i "s/rpmsave/pacsave/;s/rpmnew/pacnew/;s/,\*\.ebuild/\0,PKGBUILD*,*.install/" \
    ${pkgdir}/usr/share/vim/vim$(echo ${_srcver} | sed "s/\.//")/filetype.vim
sed -i "/find the end/,+3{s/changelog_date_entry_search/changelog_date_end_entry_search/}" \
    ${pkgdir}/usr/share/vim/vim$(echo ${_srcver} | sed "s/\.//")/ftplugin/changelog.vim

  
install -Dm644 ${srcdir}/vim$(echo ${_srcver} | sed "s/\.//")/runtime/doc/uganda.txt\
    ${pkgdir}/usr/share/licenses/${_realname}/license.txt
}
