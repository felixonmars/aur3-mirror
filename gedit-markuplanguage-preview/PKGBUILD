# Contributor: Jonas Haag <jonas@lophus.org>

pkgname=gedit-markuplanguage-preview
pkgver=20100222
pkgrel=1
pkgdesc="A markup language preview plugin for gedit (ReStructuredText, Markdown, Textile)"
arch=('x86_64' 'i686')
url='http://textmethod.com/wiki/ReStructuredTextToolsForGedit'
license=('unknown')
depends=('gedit')
optdepends=('python-markdown2: for Markdown support'
            'python-markdown:  for Markdown support (alternative package)'
            'docutils:         for ReStructuredText support'
            'python-textile:   for Textile support')
source=('http://textmethod.com/attachment/wiki/ReStructuredTextToolsForGedit/rst_gedit_tools.tar.gz?format=raw')
md5sums=('325ef7bb05d5f8a2fa4273b082353bee')

_gedit_dir="${pkgdir}/usr/lib/gedit-2/"
_gedit_plugins_dir="${_gedit_dir}/plugins/"

build() {
    cd ${srcdir}/rst_gedit_tools || return 1

    # Patch for python-markdown2 support:
    sed -i 's/import markdown/try:\n        import markdown2 as markdown\n    except ImportError:\n        import markdown/' markuppreview.py

    mkdir -p $_gedit_plugins_dir

    msg "Copying files..."
    cp markuppreview.py markuppreview.gedit-plugin $_gedit_plugins_dir || return 1
}

