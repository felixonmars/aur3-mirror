#Contributor: Kaushal M <kshlmster@gmail.com>

pkgname=publican-git
pkgver=20120530
pkgrel=2
pkgdesc="Publican is a single source publishing tool based on DocBook XML"
url="https://fedorahosted.org/publican/"
license=("GPL2" "PerlArtistic")
arch=(any)
depends=('perl' 'perl-file-finder' 'perl-file-homedir' 'perl-file-inplace'
         'perl-string-similarity' 'perl-locale-maketext-lexicon' 'perl-yaml'
         'perl-html-formattextwithlinks' 'perl-uri' 'perl-datetime'
         'perl-file-pushd' 'perl-file-find-rule' 'perl-config-simple'
         'perl-xml-treebuilder' 'perl-xml-libxslt' 'perl-file-copy-recursive'
         'perl-archive-zip' 'perl-datetime-format-dateparse'
         'perl-syntax-highlight-engine-kate' 'perl-dbi' 'perl-xml-simple'
         'perl-html-formattextwithlinksandtables' 'perl-template-toolkit'
         'wkhtmltopdf' 'docbook-xsl' 'desktop-file-utils' 'gettext')
conflicts=('publican-svn')
_gitroot=git://git.fedorahosted.org/publican.git
_gitname=publican

__name=publican

build() {
        cd $srcdir
        msg "Connecting to git server"

        if [ ! -d $_gitname ]; then
                git clone $_gitroot $_gitname
        else
                cd $_gitname && git pull
                msg 'Local git repo updated'
        fi

        msg 'Git checkout done or server timeout'
        msg 'Starting build'

        rm -rf  "$srcdir/$_gitname-build"
        git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
        cd "$srcdir/$_gitname-build/publican"

        perl Build.PL installdirs=vendor
        perl Build || return 1
}

package() {
        cd "$srcdir/$_gitname-build/publican"

        perl Build install destdir="$pkgdir"
        find $pkgdir -depth -type d -exec rmdir {} 2>/dev/null
}
