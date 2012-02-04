pkgname=publican-svn
pkgver=1940
pkgrel=2
pkgdesc="Publican publishing toolchain"
url="https://fedorahosted.org/publican/"
license=('PerlArtistic')
arch=(i686 x86_64)
depends=('perl' 'perl-archive-zip' 'perl-config-simple' 'perl-datetime-format-dateparse' 
         'perl-file-copy-recursive>=0.38' 'perl-file-find-rule' 'perl-file-pushd' 
         'perl-html-format' 'perl-html-tree' 'perl-locale-po' 
         'perl-syntax-highlight-engine-kate'
         'perl-xml-libxml>=1.67' 'perl-xml-libxslt>=1.67' 'perl-xml-simple'
         'perl-xml-treebuilder>=4.0' 'perl-dbd-sqlite' 'perl-template-toolkit'
         'perl-locale-maketext-gettext' 'perl-file-inplace' 'perl-file-homedir'
         'perl-locale-maketext-lexicon' 'perl-string-similarity'
         'perl-html-formattextwithlinksandtables' 'perl-file-which')
makedepends=('perl-devel-cover' 'perl-test-exception' 'perl-test-pod' 
             'perl-test-pod-coverage' 'perl-test-critic' 'svn')

_svntrunk=http://svn.fedorahosted.org/svn/publican/trunk/publican
_svnmod=publican

build() {
    cd $srcdir

    if [ -d $_svnmod/.svn ]; then
        (cd $_svnmod && svn up -r $pkgver)
    else
        svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi

    rm -rf $_svnmod-build
    svn export $_svnmod $_svnmod-build

    cd $_svnmod-build

    msg "SVN checkout done or server timeout"
    msg "Starting make..."

    perl Build.PL installdirs=vendor destdir="$pkgdir/"
    perl Build
    perl Build install

    # remove perllocal.pod and .packlist
    find "$pkgdir" -name perllocal.pod -delete
    find "$pkgdir" -name .packlist -delete
}

