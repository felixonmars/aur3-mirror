# Maintainer: Gilles Bedel <gillou.ray_you.are.a.bot@free.fr>

# Note that even though we use the SVN, it's not unstable at all. In comparison
# to the latest release (0.75) it fixes bugs and add the super useful
# directory-separator option. Moreover, developement of rss2imap seems stopped.
pkgname=rss2imap
pkgver=43
pkgrel=2
pkgdesc="Gets an RSS from web and delivers it to an IMAP server as e-mail."
arch=('any')
url="http://rss2imap.sourceforge.net/"
license=('GPL2')
depends=('perl' 'perl-jcode' 'perl-mail-imapclient' 'perl-xml-feedpp' 'perl-xml-rss')
makedepends=('subversion')
backup=('etc/rss2imap/rss2imap.conf' 'etc/rss2imap/rss2imap-site.conf')
install=rss2imap.install
source=('put-config-in-etc.patch'
        'rss2imap.rc'
        'rss2imap.install')

md5sums=('ca948bc53a199b7795963fe73cfc5a17'
         'd05fea5486d5fb97f397e9fa6e6b3121'
         '9f9a86422ce6251acde2c7ca368f5a36')

_svntrunk='https://rss2imap.svn.sourceforge.net/svnroot/rss2imap/trunk/rss2imap'
_svnmod='rss2imap'

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  patch -p0 < ../put-config-in-etc.patch
}

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/etc/rc.d/"
  cp rss2imap.rc "$pkgdir/etc/rc.d/rss2imap"

  cd "$srcdir/$_svnmod-build"
  mkdir -p "$pkgdir/etc/rss2imap/"
  cp conf/rss2imap.conf conf/rss2imap-site.conf "$pkgdir/etc/rss2imap/"
  cp sample.url "$pkgdir/etc/rss2imap/feeds.url.sample"

  mkdir -p "$pkgdir/usr/lib/perl5/vendor_perl/RSS2IMAPLIB"
  cp RSS2IMAPLIB/*.pm "$pkgdir/usr/lib/perl5/vendor_perl/RSS2IMAPLIB/"

  mkdir -p "$pkgdir/usr/bin/"
  cp rss2imap "$pkgdir/usr/bin/"
}

