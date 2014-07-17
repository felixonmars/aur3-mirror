# Maintainer : Jason St. John <jstjohn .. purdue . edu>

_perlmod=BioPerl
pkgname=perl-bioperl
pkgver=1.6.924
pkgrel=1
pkgdesc="BioPerl - Bioinformatics Toolkit"
arch=('any')
url="http://search.cpan.org/dist/${_perlmod}"
license=('GPL3' 'PerlArtistic')
options=('!emptydirs')
depends=('perl-data-stag>=0.11' 'perl-io-string')
makedepends=('perl-module-build>=0.42' 'perl-test-most' 'perl-uri')
checkdepends=('perl-clone')
optdepends=('perl-array-compare: Needed for Bio::PhyloNetwork (requires rebuild)'
            'perl-clone: Cloning objects (Bio::Root::Root, Bio::Tools::Primer3) (requires rebuild)'
            'perl-dbi: Needed for various tests for Bio::DB::GFF, MySQL, PostgreSQL, and SQLite (requires rebuild)'
            'perl-dbd-mysql: MySQL-related tests for Bio::DB::SeqFeature::Store (requires rebuild)'
            'perl-dbd-pg: PostgreSQL-related tests for Bio::DB::SeqFeature::Store (requires rebuild)'
            'perl-dbd-sqlite: SQLite-related tests for Bio::DB::SeqFeature::Store (requires rebuild)'
            'perl-error: OO-based exception handling (Bio::Root::Exception)'
            'perl-gd: Alignment graphic output (Bio::Align::Graphics) (requires rebuild)'
            'perl-graph>=0.50: Phylogenetic Networks, ontology engine implementation, contig analysis (Bio::PhyloNetwork, Bio::Ontology::SimpleGOEngine::GraphAdaptor, Bio::Assembly::Tools::ContigSpectrum) (requires rebuild)'
            'perl-graphviz: Phylogenetic Network visulization (Bio::PhyloNetwork::GraphViz) (requires rebuild)'
            'perl-html-tableextract: Parsing HTML tables (Bio::DB::SeqVersion::gi) (requires rebuild)'
            'perl-list-moreutils: Back- or reverse-translation of sequences (Bio::Tools::SeqPattern, Bio::Tools::SeqPattern::BackTranslate) (requires rebuild)'
            'perl-math-random: Random Phylogenetic Networks (Bio::PhyloNetwork::RandomFactory)'
            'perl-set-scaler: Proper operation (Bio::Tree::Compatible) (requires rebuild)'
            'perl-soap-lite: Bibliographic queries (Bio::DB::Biblio::soap)'
            'perl-sort-naturally: Sort lexically, but sort numeral parts numerically (Bio::Assembly::IO::ace, Bio::Assembly::IO::tigr) (requires rebuild)'
            'perl-spreadsheet-parseexcel: Read Microsoft Excel files (Bio::SeqIO::excel) (requires rebuild)'
            'perl-svg>=2.26: For generating SVG images (Bio::Draw::Pictogram) (requires rebuild)'
            'perl-xml-parser: Parsing XML (Bio::Biblio::IO::medlinexml) (requires rebuild)'
            'perl-xml-sax>=0.15: Parsing XML (Bio::SearchIO::blastxml, Bio::SeqIO::tigrxml, Bio::SeqIO::bsml_sax) (requires rebuild)'
            'perl-xml-sax-writer: Writing XML (Bio::SeqIO::tigrxml) (requires rebuild)'
            'perl-xml-simple: Reading custom XML (Bio::Tools::EUtilities, Bio::DB::HIV, Bio::DB::Query::HIVQuery)'
            'perl-xml-twig: Parsing XML (Bio::Variation::IO::xml, Bio::DB::Taxonomy::entrez, Bio::DB::Biblio::eutils) (requires rebuild)'
            'perl-xml-writer>=0.4: Parsing and writing XML (Bio::SeqIO::agave, Bio::SeqIO::game::gameWriter, Bio::SeqIO::chadoxml, Bio::SeqIO::tinyseq, Bio::Variation::IO::xml, Bio::SearchIO::Writer::BSMLResultWriter) (requires rebuild)'
            'perl-yaml: For using "GenBank->GFF3/bp_genbank2gff3.pl" (requires rebuild)')
source=("http://cpan.org/modules/by-module/Bio/${_perlmod}-${pkgver}.tar.gz")
sha512sums=('49f732ece2c1d9ed39f951e51dd1c201f1ed528d3e5b765cd770b8992ecf5c4ef6bce2d38a261581c25d8d49dbbb17f1e15c897be1beed800ff5b8079b68503a')

build() {
	cd "${_perlmod}-${pkgver}"

	# Install module in vendor directories.
	perl Build.PL installdirs=vendor destdir="${pkgdir}"
	perl Build
}

check() {
	cd "${_perlmod}-${pkgver}"
	perl Build test
}

package() {
	cd "${_perlmod}-${pkgver}"
	perl Build install
}
